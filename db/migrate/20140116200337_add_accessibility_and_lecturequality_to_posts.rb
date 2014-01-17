class AddAccessibilityAndLecturequalityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :accessibility, :string
    add_column :posts, :lecturequality, :string
  end
end
