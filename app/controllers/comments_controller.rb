class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:post_id])
        @comment = @Article.comments.create(params[:comment].permit(:name, :body))

        redirect_to post_article(@Article)
end
end
