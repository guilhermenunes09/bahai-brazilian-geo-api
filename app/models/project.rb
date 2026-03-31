class Project < ApplicationRecord
  SCOPE_MODES = %w[region country].freeze

  has_many :project_legends, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :scope_mode, inclusion: { in: SCOPE_MODES }
  validate :scope_presence_for_mode

  before_validation :ensure_slug

  def merged_config
    defaults.deep_merge(config || {})
  end

  private

  def ensure_slug
    return if slug.present?

    self.slug = name.to_s.parameterize
  end

  def scope_presence_for_mode
    if scope_mode == 'region' && scope_region_name.blank?
      errors.add(:scope_region_name, "can't be blank for region scope")
    end

    if scope_mode == 'country' && scope_country_name.blank?
      errors.add(:scope_country_name, "can't be blank for country scope")
    end
  end

  def defaults
    {
      'version' => 1,
      'title' => {
        'title' => '',
        'subtitle' => ''
      },
      'layers' => {
        'clusters' => base_layer_config(true, 9),
        'zones' => base_layer_config(false, 8),
        'states' => base_layer_config(true, 7),
        'regions' => base_layer_config(true, 6),
        'countries' => base_layer_config(false, 5)
      },
      'markersPosition' => {},
      'milestonesColor' => {
        'incipient' => '#f2fff3',
        'one' => '#8cfa95',
        'two' => '#4fa857',
        'three' => '#306634',
        'frontiers' => '#1b381d'
      },
      'mapView' => {
        'center' => {
          'lat' => -13.5722,
          'lng' => -52.9852
        },
        'zoom' => 5.6
      },
      'overrides' => {
        'clusters' => {},
        'states' => {},
        'regions' => {},
        'zones' => {}
      }
    }
  end

  def base_layer_config(visible, z_index)
    {
      'visible' => visible,
      'zIndex' => z_index,
      'polygon' => {},
      'label' => {},
      'marker' => {}
    }
  end
end
