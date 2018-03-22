# == Schema Information
#
# Table name: preset_categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  status     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class PresetCategory < ActiveRecord::Base
    scope :active, -> {where(status: 1)}
end
