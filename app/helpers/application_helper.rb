module ApplicationHelper
    def full_title(page_title = '')
        base_title = "Insomniax"
        if page_title.empty?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end

    def gravatar_message(user, options = { size: 30 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        avatar_url = user.avatar? ? user.avatar.url : gravatar_url
        image_tag(avatar_url, alt: user.name, class: "img-rounded")
    end

end
