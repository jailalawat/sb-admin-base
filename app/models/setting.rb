# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  group      :string(255)
#  key        :string(255)
#  value      :string(255)
#  note       :text
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)
#

class Setting < ActiveRecord::Base
  scope :active, -> {where(status: ["active", nil])}
end
