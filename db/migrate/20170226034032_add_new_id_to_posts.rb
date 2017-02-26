class AddNewIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category_id, :integer
    remove_column :posts, :category, :string
  end
end
