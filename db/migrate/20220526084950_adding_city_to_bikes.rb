class AddingCityToBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :city, :string
  end
end
