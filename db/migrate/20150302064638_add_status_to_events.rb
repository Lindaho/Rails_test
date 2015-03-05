class AddStatusToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :ststus, :string
  end
end
