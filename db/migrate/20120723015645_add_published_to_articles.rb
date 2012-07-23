class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :datetime
    add_column :articles, :state, :string
  end
end
