class PresetCategory < ActiveRecord::Base
    scope :active, -> {where(status: 1)}
end
