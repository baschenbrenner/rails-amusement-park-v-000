class User < ActiveRecord::Base
    has_secure_password
    enum role: [:normal, :admin]
    has_many :rides
    has_many :attractions, through: :rides
 
    def mood
        if self.happiness > self.nausea
            return "happy"
        else
            return "sad"
        end
    end
    
end
