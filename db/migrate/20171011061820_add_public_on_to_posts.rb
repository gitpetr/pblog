class AddPublicOnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :public_on, :boolean, default: false
  end
end
