class ForumThreadsController < ApplicationController
  before_action :set_forum_thread,except: [:index, :new, :create]
  def index
    @q = ForumThread.search(params[:q])
    @forum_threads = @q.result(distinct: true)

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
  end
private

def set_forum_thread
@forum_thread = ForumThread.find(params[:id])
end

def forum_threads_params

  params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])

end

end
