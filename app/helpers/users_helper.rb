module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "micropost-avatar")
    end
    def gravatar_followed_user(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "followed-avatar")
    end
    def gravatar_follow(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "follow-avatar")
    end
    def gravatar_profile(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: " twPc-avatarImg")
    end
    def gravatar_dprofile(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "http://bootdey.com/img/Content/bg_element.jpg"
        dprofile_url = user.dprofile? ? user.dprofile.url : gravatar_url
        image_tag(dprofile_url, alt: user.name, class: " twPc-bg twPc-block")
    end
    def gravatar_mprofile(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: " circle")
    end
    def gravatar_mdprofile(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "http://bootdey.com/img/Content/bg_element.jpg"
        dprofile_url = user.dprofile? ? user.dprofile.url : gravatar_url
        image_tag(dprofile_url, alt: user.name, class: " background")
    end
    def gravatar_comment(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "http://bootdey.com/img/Content/bg_element.jpg"
        dprofile_url = user.dprofile? ? user.dprofile.url : gravatar_url
        image_tag(dprofile_url, alt: user.name, class: " circle")
    end
    def gravatar_all(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "responsive-img circle profile-avatar")
    end
 def gravatar_post(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
     avatar_url = user.avatar? ? user.avatar.url : gravatar_url
     image_tag(avatar_url, alt: user.name, class: "circle")
    end

    def gravatar_message(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "message-avatar circle")
    end
    def gravatar_forum(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "circle")
    end
end
