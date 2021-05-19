class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :name, :string
  end
end
