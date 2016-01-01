class ArticlesController < ApplicationController
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

    end


   private

    def article_params
        params.require(:article).permit(:title, :body, :tag_list)
   end
end
