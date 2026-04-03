module Paginatable
  extend ActiveSupport::Concern

  private

  def apply_pagination_and_sort(scope, allowed_columns:, serializer:, column_map: {}, search_map: {})
    # column_map / search_map values: { expr: 'table.col', text: true/false }
    sort_by_param = params[:sort_by].to_s
    if column_map.key?(sort_by_param)
      entry     = column_map[sort_by_param]
      sort_expr = entry[:expr]
      is_text   = entry[:text]
      sort_by   = sort_by_param
    elsif allowed_columns.include?(sort_by_param)
      sort_expr = sort_by_param
      is_text   = false
      sort_by   = sort_by_param
    else
      sort_by   = allowed_columns.first
      entry     = column_map[sort_by]
      sort_expr = entry ? entry[:expr] : sort_by
      is_text   = entry ? entry[:text] : false
    end
    sort_dir    = params[:sort_dir] == 'desc' ? 'desc' : 'asc'
    order_expr  = is_text ? "unaccent(#{sort_expr}::text) #{sort_dir}" : "#{sort_expr} #{sort_dir}"
    scope       = scope.reorder(Arel.sql(order_expr))

    # Search
    search_by    = params[:search_by].to_s
    search_query = params[:search_query].to_s.strip
    if search_map.key?(search_by) && search_query.present?
      entry = search_map[search_by]
      expr  = entry[:expr]
      if entry[:text]
        scope = scope.where("unaccent(#{expr}::text) ILIKE unaccent(?)", "%#{search_query}%")
      else
        scope = scope.where("#{expr}::text ILIKE ?", "%#{search_query}%")
      end
    end

    # Pagination
    per_page    = [[( params[:per_page] || 20).to_i, 1].max, 100].min
    page        = [[params[:page].to_i, 1].max, 1].max
    total_count = scope.count
    total_pages = [(total_count.to_f / per_page).ceil, 1].max
    records     = scope.limit(per_page).offset((page - 1) * per_page)

    render json: {
      data: records.map { |r| serializer.new(r).as_json },
      meta: {
        total_count: total_count,
        page:        page,
        per_page:    per_page,
        total_pages: total_pages,
        sort_by:     sort_by,
        sort_dir:    sort_dir
      }
    }
  end
end
