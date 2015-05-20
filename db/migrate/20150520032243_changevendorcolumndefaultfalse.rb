class Changevendorcolumndefaultfalse < ActiveRecord::Migration
  def change
  	change_column :users, :vendor, :boolean, {:default => false}
  end
end
