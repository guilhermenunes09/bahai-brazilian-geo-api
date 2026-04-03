class BahaiZoneListSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :clusters_count

  def region
    {
      id: object.region&.id,
      name: object.region&.name
    }
  end

  def clusters_count
    object.bahai_clusters.size
  end
end
