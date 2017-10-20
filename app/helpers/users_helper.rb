module UsersHelper

  def profile_img(user)
   #return image_tag(user.avatar, alt: user.name) if user.avatar?
    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'wh50.jpg'
    end
    image_tag(img_url, alt: user.name)
  end

end
