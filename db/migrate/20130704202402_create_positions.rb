class CreatePositions < ActiveRecord::Migration
  
  def up
	create_table :positions do |t|
		t.integer :item_id
		t.integer :cart_id
		t.integer :quantity
		t.timestamps
	end
  end
  
  def down
	drop_table :positions
  end

  end
