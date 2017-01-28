class ForumThreadsController < ApplicationController
  before_action :set_forum_thread,except: [:index, :new, :create,]
    impressionist :actions=>[:show]
  def index
    @q = ForumThread.search(params[:q])
    @forum_threads = @q.result(distinct: true).order(created_at: :desc)

  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_threads_params
    @forum_thread.forum_posts.first.user_id = current_user.id
    if @forum_thread.save
        redirect_to @forum_thread
      else
        render new
    end
  end

  def show
    @forum_post = ForumPost.new
    impressionist(@forum_thread)
    prepare_meta_tags(
    title: @forum_thread.subject,

        #keywords: @article.tags,

        #twitter: {card: "summary_large_image"}
        twitter: {
          #site_name: site_name,
          title: @forum_thread.subject,
          site: '@theinsomniax',
          #keywords: @article.tags,
          card: 'insomniax social networking community gor geeks',
          description: @forum_thread.forum_posts.first.body,
        },
        og: {
          #url: current_url,
          #site_name: site_name,
          title: @forum_thread.subject,
          keywords: %[@forum_thread.subject],
          description: @forum_thread.forum_posts.first.body,

          type: 'website'
        })
  end
  def destroy
      @forum_thread_delete = ForumThread.find(params[:id])
      @forum_thread_delete.destroy

      redirect_to :back
  end
private

def set_forum_thread
@forum_thread = ForumThread.friendly.find(params[:id])
end

def forum_threads_params

  params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])

end

end
