# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  cart_id    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Transcript < ActiveRecord::Base
end
