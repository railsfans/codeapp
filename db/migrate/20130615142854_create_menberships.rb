class CreateMenberships < ActiveRecord::Migration
  def change
    create_table :menberships do |t|
      t.integer :supplier_id
      t.integer :code_id

      t.timestamps
    end
  end
end
