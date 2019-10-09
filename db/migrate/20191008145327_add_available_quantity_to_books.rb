class AddAvailableQuantityToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :available_quantity, :integer
  end
end
