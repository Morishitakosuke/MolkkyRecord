class AddTagcontentToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :tagcontent, :string
  end
end
