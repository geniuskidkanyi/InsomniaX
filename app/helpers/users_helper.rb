module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "micropost-avatar")
    end
    def gravatar_profile(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "img-responsive thumbnail")
    end
    def gravatar_all(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "img-circle profile-avatar")
    end
 def gravatar_post(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
     avatar_url = user.avatar? ? user.avatar.url : gravatar_url
     image_tag(avatar_url, alt: user.name, class: "img-circle avatar")
    end

    def gravatar_message(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "message-avatar")
    end
    def gravatar_forum(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "message-avatar")
    end
end
