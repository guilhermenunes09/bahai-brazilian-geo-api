class BahaiZoneListSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :clusters_count, :cluster_names

  def region
    {
      id: object.region&.id,
      name: object.region&.name
    }
  end

  def clusters_count
    object.bahai_clusters.size
  end

  def cluster_names
    object.bahai_clusters.map(&:name)
  end
end
