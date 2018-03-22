class User < ActiveRecord::Base

    #Encrypt password
    def encrypt_password(password, salt) 
        Digest::SHA2.hexdigest(password + salt)
    end
  
    def password=(password) 
        @password = password
  
        if password.present?
            generate_salt
            self.password = encrypt_password(password, salt)
        end
    end
    def getByEmail(email)
        return User.where(email: email).first
    end
    def authenticate(name, password) 
        if user = getByEmail(name)
            if user.password == encrypt_password(password, user.salt)
               return user
            end
        end
        return nil
    end
    #Generate Salt
    def generate_salt
        self.salt = self.object_id.to_s + rand.to_s        
    end
end
