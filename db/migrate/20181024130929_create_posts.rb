class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.uuid :user_id, index: true, null: false
      t.timestamps
    end
  end
end
