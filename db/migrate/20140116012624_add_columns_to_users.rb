class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string, :null => false
  	add_column :users, :last_name, :string, :null => false
  	add_column :users, :mobile, :integer
  	add_column :users, :morning_sms, :time
  	add_column :users, :evening_sms, :time
  end
end
