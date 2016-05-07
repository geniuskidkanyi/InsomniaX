class ArticlesController < ApplicationController

    before_action :admin_user, only: :create



    impressionist actions: [:show], unique: [:session_hash]
    def index
        @article = Article.paginate(page: params[:page],:per_page => 12)

    end

   def new
     @article = Article.new
   end

    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:success] = 'Micropost created!'
            redirect_to @article
         else
        render 'new'
         end
    end
    def show
        @article = Article.friendly.find(params[:id])
        @articles = Article.friendly.order("created_at DESC").limit(5).offset(1)
        impressionist(@article)
        @new_comment    = Comment.build_from(@article, current_user, "")
                    prepare_meta_tags(
                    title: @article.title,
                        description: @article.body,
                        #keywords: @article.tags,
                        image: @article.picture_article.url,
                        #twitter: {card: "summary_large_image"}
                        twitter: {
                          #site_name: site_name,
                          title: @article.title,
                          site: '@theinsomniax',
                          #keywords: @article.tags,
                          card: 'insomniax socialnetworking community gor geeks',
                          description: @article.body,
                          image: @article.picture_article.url
                        },
                        og: {
                          #url: current_url,
                          #site_name: site_name,
                          title: @article.title,
                          #keywords: @article.tags,
                          image: @article.picture_article.url,
                          description: @article.body,
                          type: 'website'
                        })

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
