module Paginatable
  extend ActiveSupport::Concern

  private

  def apply_pagination_and_sort(scope, allowed_columns:, serializer:, column_map: {})
    # Sorting — column_map allows sorting by joined-table columns, e.g. { 'zone' => 'bahai_zones.name' }
    sort_by_param = params[:sort_by].to_s
    if column_map.key?(sort_by_param)
      # Prefer the explicit table-qualified expression from column_map
      sort_expr = column_map[sort_by_param]
      sort_by   = sort_by_param
    elsif allowed_columns.include?(sort_by_param)
      sort_expr = sort_by_param
      sort_by   = sort_by_param
    else
      sort_by   = allowed_columns.first
      sort_expr = column_map[sort_by] || sort_by
    end
    sort_dir = params[:sort_dir] == 'desc' ? 'desc' : 'asc'
    scope    = scope.reorder(Arel.sql("unaccent(#{sort_expr}::text) #{sort_dir}"))

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
