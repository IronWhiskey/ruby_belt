class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :idea
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
