class AddAssistColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_hidden, :boolean, default: false
    add_column :products, :is_command, :boolean, default: false
    add_column :products, :color, :integer, default: 0

    add_index :products, :is_hidden
    add_index :products, :color
  end
end
