class ChangeContentToBeTextInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :content, :text, null: false
  end
  def down
    change_column :comments, :content, :string, null: false
  end
end
