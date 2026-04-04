class BahaiCluster < ApplicationRecord
  belongs_to :bahai_zone, optional: true
  has_many :cities, dependent: :destroy

  enum milestone: {
    virgem: -1,
    incipient: 0,
    one: 1,
    two: 2,
    three: 3,
    frontiers: 4
  }

  after_commit :recompute_parent_zones, on: [:create, :update], if: :should_recompute_zone?
  after_commit :recompute_parent_zone_on_destroy, on: :destroy

  private

  def should_recompute_zone?
    previous_changes.key?('bahai_zone_id')
  end

  def recompute_parent_zones
    old_zid, new_zid = previous_changes['bahai_zone_id']
    [old_zid, new_zid].compact.uniq.each do |zid|
      zone = BahaiZone.includes(bahai_clusters: :cities).find_by(id: zid)
      BahaiZones::UnifyGeojsonService.new(zone).call if zone
    end
  end

  def recompute_parent_zone_on_destroy
    return unless bahai_zone_id

    zone = BahaiZone.includes(bahai_clusters: :cities).find_by(id: bahai_zone_id)
    BahaiZones::UnifyGeojsonService.new(zone).call if zone
  end
end
