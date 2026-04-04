class City < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :bahai_cluster, optional: true

  after_commit :recompute_parents, on: [:create, :update], if: :should_recompute?
  after_commit :recompute_parents_on_destroy, on: :destroy

  private

  def should_recompute?
    (previous_changes.keys & %w[bahai_cluster_id geojson_data]).any?
  end

  def recompute_parents
    cluster_ids = []
    zone_ids    = []

    if previous_changes.key?('bahai_cluster_id')
      # City moved between clusters — recompute both old and new cluster and their zones
      old_cid, new_cid = previous_changes['bahai_cluster_id']
      [old_cid, new_cid].compact.each do |cid|
        cluster_ids << cid
        zid = BahaiCluster.find_by(id: cid)&.bahai_zone_id
        zone_ids << zid if zid
      end
    elsif previous_changes.key?('geojson_data') && bahai_cluster_id
      cluster_ids << bahai_cluster_id
      zid = BahaiCluster.find_by(id: bahai_cluster_id)&.bahai_zone_id
      zone_ids << zid if zid
    end

    cluster_ids.uniq.each do |cid|
      cluster = BahaiCluster.includes(:cities).find_by(id: cid)
      BahaiClusters::UnifyGeojsonService.new(cluster).call if cluster
    end

    zone_ids.uniq.each do |zid|
      zone = BahaiZone.includes(bahai_clusters: :cities).find_by(id: zid)
      BahaiZones::UnifyGeojsonService.new(zone).call if zone
    end
  end

  def recompute_parents_on_destroy
    return unless bahai_cluster_id

    cluster = BahaiCluster.includes(:cities).find_by(id: bahai_cluster_id)
    BahaiClusters::UnifyGeojsonService.new(cluster).call if cluster

    zid = BahaiCluster.find_by(id: bahai_cluster_id)&.bahai_zone_id
    return unless zid

    zone = BahaiZone.includes(bahai_clusters: :cities).find_by(id: zid)
    BahaiZones::UnifyGeojsonService.new(zone).call if zone
  end
end
