class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :legend
      t.string :date_photo

      t.timestamps
    end
  end
end
