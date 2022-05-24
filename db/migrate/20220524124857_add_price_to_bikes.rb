class AddPriceToBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :price, :integer
  end
end
