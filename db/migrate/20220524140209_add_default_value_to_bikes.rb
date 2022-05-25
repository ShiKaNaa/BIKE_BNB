class AddDefaultValueToBikes < ActiveRecord::Migration[6.1]
  def change
    change_column :bikes, :available, :boolean, default: true
  end
end
