class AddUrlSlugToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :url_slug, :string
  end
end
