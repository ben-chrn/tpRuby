class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    	t.integer :user_id
      t.string :title
      t.string :message
      t.boolean :published

      t.timestamps
    end

    change_column :posts, :published , :boolean, :default => true
  end
end
