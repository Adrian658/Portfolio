class AddTypeToSkill < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :type, :string
  end
end
