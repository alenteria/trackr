class RemoveFnameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :fname
  end

  def down
    add_column :users, :fname, :string
  end
end
