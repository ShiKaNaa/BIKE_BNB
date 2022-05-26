class ChangingTypeToDateBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
  end
end

# 'date USING CAST(start_date AS date)'
# 'date USING CAST(end_date AS date)'
