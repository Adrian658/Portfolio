class RenameSkillsTypetoCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :skills, :type, :category
  end
end
