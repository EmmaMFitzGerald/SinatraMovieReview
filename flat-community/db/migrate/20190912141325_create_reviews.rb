class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :genre
      t.string :content
      t.integer :user_id
    end
  end
end
