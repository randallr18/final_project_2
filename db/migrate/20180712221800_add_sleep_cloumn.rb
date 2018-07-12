class AddSleepCloumn < ActiveRecord::Migration[5.2]
  def change
    add_column :sleeps, :user_id, :integer
  end
end
