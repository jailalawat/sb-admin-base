# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  fullName               :string(255)
#  department             :string(255)
#  position               :string(255)
#  email                  :string(255)
#  password               :string(255)
#  activeKey              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  salt                   :string(255)
#  status                 :integer          default(0), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  STATUS = [["on", 1], ["off", 0]]
    #Encrypt password
    # def encrypt_password(password, salt) 
    #     Digest::SHA2.hexdigest(password + salt)
    # end
  
    # def password=(password) 
    #     @password = password
  
    #     if password.present?
    #         generate_salt
    #         self.password = encrypt_password(password, salt)
    #     end
    # end

    def getByEmail(email)
        return User.where(email: email).first
    end
    
    # def authenticate(name, password) 
    #     if user = getByEmail(name)
    #         if user.password == encrypt_password(password, user.salt)
    #            return user
    #         end
    #     end
    #     return nil
    # end
    # #Generate Salt
    # def generate_salt
    #     self.salt = self.object_id.to_s + rand.to_s        
    # end
end
