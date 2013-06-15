class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code
      t.string :name
      t.integer :parent_id
      t.text :describe
      t.string :footprint
      t.string :manufacturer
      t.string :partNum
      t.integer :quantity
      t.float :unitprice
      t.text :comment
      t.boolean :codeLength, :default=>true

      t.timestamps
    end
  end
end
