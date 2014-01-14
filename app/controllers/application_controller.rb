class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?	
  helper_method :aftorise_admin
  helper_method :comment_user_id

#  I18n.locale = :ru

  def after_sign_out_path_for(user)
  	:back
  end

  def after_sign_in_path_for(user)
  	posts_path
  end

  def admin?
  	if user_signed_in?
  	  if (current_user.try(:email)=="alexvokitoki@gmail.com" || current_user.try(:email)=="vanopiano@gmail.com")
  	    	current_user.update_attribute(:is_blogger, true)
  	  else
    	current_user.update_attribute(:is_blogger, false)
	  end
      return current_user.is_blogger
    end
     return false
  end

 
  def aftorise_admin
  	redirect_to root_path unless admin?
  end

  def comment_user_id
  	cid =  0
  	if (current_user)
		cid = current_user.id
	else cid=User.guest_user.id
	end

	cid
  end
  
  @categories = Category.all


end
