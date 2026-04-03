module Projects
  # Seeds a new project with all records from each layer type.
  # Called on project create and duplicate.
  class LayerItemsSeeder
    LAYER_SOURCES = {
      'states'         => -> { State.pluck(:id) },
      'bahai_zones'    => -> { BahaiZone.pluck(:id) },
      'bahai_regions'  => -> { BahaiRegion.pluck(:id) },
      'regions'        => -> { Region.pluck(:id) },
      'countries'      => -> { Country.pluck(:id) },
      'bahai_clusters' => -> { BahaiCluster.where(active: true).pluck(:id) },
    }.freeze

    def self.seed(project)
      new(project).seed
    end

    def initialize(project)
      @project = project
    end

    def seed
      rows = []
      LAYER_SOURCES.each do |slug, id_loader|
        id_loader.call.each do |item_id|
          rows << {
            project_id: @project.id,
            layer_slug: slug,
            item_type:  slug,
            item_id:    item_id,
            sort_order: 0,
            created_at: Time.current,
            updated_at: Time.current,
          }
        end
      end
      ProjectLayerItem.insert_all(rows, unique_by: :index_project_layer_items_unique_per_project)
    end
  end
end
