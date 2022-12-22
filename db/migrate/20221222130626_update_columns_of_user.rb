class UpdateColumnsOfUser < ActiveRecord::Migration[7.0]
  def up
    change_table(:users, bulk: true) do |t|
      t.change :first_name, :string, default: "", null: false
      t.change :last_name, :string, default: "", null: false
      t.remove :role
      t.column :admin, :boolean, default: false, null: false
    end
  end

  def down
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name, :string, null: true
    add_column :users, :role, :string, null: true
    remove_column :users, :admin
  end 
end
