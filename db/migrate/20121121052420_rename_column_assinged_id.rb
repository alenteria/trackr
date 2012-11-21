class RenameColumnAssingedId < ActiveRecord::Migration
  def up
    rename_column :assignments, :assigned_id, :user_id
  end

  def down
  end
end
