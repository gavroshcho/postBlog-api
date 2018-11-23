class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, index: true, uniqueness: true
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
