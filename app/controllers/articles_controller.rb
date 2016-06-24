class ArticlesController < ApplicationController
   
    before_action :admin_user, only: :create
<<<<<<< HEAD
    before_action :admin_user, only: :edit
=======

    
>>>>>>> 015af606dcaccc1b62d3729475ccbf992a1c5383

    impressionist actions: [:show], unique: [:session_hash]
    def index
        @articles = Article.all.order('created_at DESC')

    end

    def new
   end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
         else
        render 'new'
         end
    end
    def show
        @article = Article.friendly.find(params[:id])

        @new_comment    = Comment.build_from(@article, current_user, "")
    end
    
    def edit
        @article = Article.friendly.find(params[:id])
    end

    def update
        @article = Article.friendly.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
           else
        render 'edit'
    end
  end


    def destroy
     @article = Article.friendly.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end


   private

    def article_params
        params.require(:article).permit(:title, :body, :tag_list, :picture_article)
   end
      def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
