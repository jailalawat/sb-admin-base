# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image_data :text
#  created_at :datetime
#  updated_at :datetime
#

class Photo < ActiveRecord::Base
  include ImageUploader[:image]   
end
