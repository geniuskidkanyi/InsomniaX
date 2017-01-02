class ApplicationController < ActionController::Base
    before_action :prepare_meta_tags, if: "request.get?"
    before_action :load_activities
      before_action :configure_permitted_parameters, if: :devise_controller?


    rescue_from ActiveRecord::RecordNotFound do
        flash[:warning] = 'Resource not found.'
        redirect_back_or root_path
    end


      def prepare_meta_tags(options={})
        site_name   = "Insomniax"
        description = "Super charge your skills with expert authored tech and creative training with insomniax(Atus sec). the best social networkign site
        for geeks "
        current_url = request.url
        image =
        # Let's prepare a nice set of defaults
        defaults = {
          site:        site_name,
          description: description,
          keywords:    %w[website socialnetworking development mobile app blogging insomniax],
          twitter: {
            site_name: site_name,
            site: '@theinsomniax',
            card: 'insomniax socialneworking community gor geeks',
            description: description,
            image: image
          },
          og: {
            url: current_url,
            site_name: site_name,
            image: image,
            description: description,
            type: 'website'
          }
        }

        options.reverse_merge!(defaults)

        set_meta_tags options
      end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


protected
def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username])
end

    private
    def load_activities
    @q = ForumThread.search(params[:q])
    @forum_threads = ForumThread.first(10)
    @direct_messages = Chatgroup.direct_messages
    end
    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
