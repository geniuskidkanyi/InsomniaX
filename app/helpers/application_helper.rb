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

    def flash_messages(options = {})
        flash_messages = []
        flash.each do |type, message|
          type = type.to_sym
          type = :success if type == :notice
          type = :error   if type == :alert
          text = "<script>toastr.#{type}('#{message}');</script>"
          flash_messages << text.html_safe if message
        end
        flash_messages.join("n").html_safe
    end

end
