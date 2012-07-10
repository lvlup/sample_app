# encoding: utf-8
module UsersHelper
  
 def user_name(user)
    return "Аноним" if user.nil? 
    else return user.name
 end
   

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
