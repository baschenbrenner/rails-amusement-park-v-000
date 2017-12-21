class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  
  validates :user_id, presence: true
  validates :attraction_id, presence: true
  
  def take_ride
      @user = User.find(self.user_id)
      @attraction = Attraction.find(self.attraction_id)
      if @user.tickets >= @attraction.tickets
        if @user.height >= @attraction.min_height
            @user.tickets -= @attraction.tickets
            @user.happiness += @attraction.happiness_rating
            @user.nausea += @attraction.nausea_rating
            @user.save
            return "Thanks for riding the #{@attraction.name}!"
        else
            return "Sorry. You are not tall enough to ride the #{@attraction.name}."
        end
      else
         if @user.height >= @attraction.min_height
             return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
         else
            return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
         end
      end
        
  end
  
end
