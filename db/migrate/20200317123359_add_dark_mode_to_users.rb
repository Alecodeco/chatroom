class AddDarkModeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :has_dark_active, :boolean
  end
end
