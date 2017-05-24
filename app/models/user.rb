class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,
	 :omniauth_providers => [:facebook]
 
  #This method is for creating a new user athenticated with facebook and we are going to describe each step in its construction
 
  #This method will be called from the controller and it's a class method because it don't needs to be instanced
  #We will send one parameter (auth) que arrives from the Facebook API; this parameter has all the information of the user, we will use the information of provider and uid.
  #We will be a query (with a where) to the data base with and we will combinate with a method of the active record, this one will found the first element inside data base o it creates a new element.
  #We'll ask if the paramter that we send it has the structure auth[:info] and we'll fill the user's information
  #Finaly we are going to a password for completing the user's creation.
  #This method are going to call from users' controller. 

  has_many :articles

  def self.from_omniath(auth) 
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      if auth[:info]      
        user.email = auth[:info][:email]
        user.user_name = auth[:info][:name]
      end
      user.password = Devise.friendly_token[0,20]    
    end
  end  
 
end
