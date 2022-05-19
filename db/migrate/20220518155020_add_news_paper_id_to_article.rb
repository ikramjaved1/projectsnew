class AddNewsPaperIdToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :news_paper, index: true
  end
end
