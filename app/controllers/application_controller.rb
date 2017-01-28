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
        description = "Super charge your skills with expert authored tech and creative training with
         insomniax(Atus sec). the best social networking site
        for geeks "
        current_url = request.url
        image =
        # Let's prepare a nice set of defaults
        defaults = {
          site:        site_name,
          description: description,
          keywords:    %w[website social networking development mobile app blogging insomniax atussec atussec],
          canonical: request.url,
          twitter: {
            site_name: site_name,
            site: '@theinsomniax',
            card: 'insomniax social networking community for geeks',
            description: description,
            image: image,
            canonical: request.url
          },
          og: {
            url: current_url,
            site_name: site_name,
            image: image,
            description: description,
            canonical: request.url,
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

  helper_method :resource_name, :resource, :devise_mapping

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
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
