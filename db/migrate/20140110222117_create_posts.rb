class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :department
      t.string :professor
      t.string :course
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:course, :created_at]
  end
end
