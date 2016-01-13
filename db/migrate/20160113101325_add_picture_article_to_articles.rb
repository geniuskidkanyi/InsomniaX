class AddPictureArticleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :picture_article, :string
  end
end
