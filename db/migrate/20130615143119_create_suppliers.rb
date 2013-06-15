class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :company
      t.string :address
      t.string :website
      t.string :contactor
      t.string :phone
      t.string :fax
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
