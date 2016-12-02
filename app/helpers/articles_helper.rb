module ArticlesHelper
  def article_for(article, options = { size: 80 })
      size = options[:size]
      gravatar_url = "http://localhost:3000/no-image.png"
      avatar_url = article.picture_article? ? article.picture_article.url : gravatar_url
      image_tag(avatar_url,  class: "micropost-avatar")
  end
end
# article.picture_article.url if article.picture_article?
# <%= image_tag article.picture_article.url if article.picture_article? %>
