class CreateSubComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_comments do |t|
      t.text :content, null: false
      t.belongs_to :comment, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
