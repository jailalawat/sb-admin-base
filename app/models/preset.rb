# == Schema Information
#
# Table name: presets
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  path        :string(255)      not null
#  category_id :integer
#  status      :boolean          default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Preset < ActiveRecord::Base
    attr_accessor :file_upload
end
