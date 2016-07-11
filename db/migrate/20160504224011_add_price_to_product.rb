class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :product, :price, :decimal	
  end
end
