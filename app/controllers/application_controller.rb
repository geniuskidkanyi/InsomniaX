class ApplicationController < ActionController::Base
    before_action :prepare_meta_tags, if: "request.get?"
 include PublicActivity::StoreController
  def forem_user
    current_user
  end

  before_action :load_activities
  helper_method :forem_user

    rescue_from ActiveRecord::RecordNotFound do
        flash[:warning] = 'Resource not found.'
        redirect_back_or root_path
    end

    def redirect_back_or(path)
        redirect_to request.referer || path
    end


      def prepare_meta_tags(options={})
        site_name   = "Insomniax"
        title       = [controller_name, action_name].join(" ")
        description = "Super charge your skills with expert authored tech and creative training with insomniax(Atus sec). the best social networkign site
        for geeks "
        current_url = request.url

        # Let's prepare a nice set of defaults
        defaults = {
          site:        site_name,
          title:       title,
          description: description,
          keywords:    %w[website socialnetwork development mobile app blogging insomniax],
          twitter: {
            site_name: site_name,
            site: '@theinsomniax',
            card: 'summary',
            description: description,
            #image: image
          },
          og: {
            url: current_url,
            site_name: site_name,
            title: title,
            #image: image,
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
  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end



    private

    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
