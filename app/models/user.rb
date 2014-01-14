# coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :current_password
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :posts
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :current_password, :user_pic


def self.guest_user
	user = User.where(:email => "guestuser@vanoblog.tk").first

    unless user
        user = User.create(
        					name: "Гость",
	    					email: "guestuser@vanoblog.tk",
	            			password: Devise.friendly_token[0,20]
	    		  		  )
    end

user
end

def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(name: data["name"],
	    		   email: data["email"],
	    		   user_pic: data["picture"],
             password: Devise.friendly_token[0,20]
	    		  )
    end

    #для обновления имени
    user.update_attribute(:name, data["name"])
    user.update_attribute(:user_pic, data["image"])
    
    user.posts.each do |p|
          p.update_attribute(:author, user.name)
    end


    user 
end





end
