class CreateLabelRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :label_relationships do |t|
      t.integer :label_id
      t.integer :product_id

      t.timestamps
    end
  end
end
