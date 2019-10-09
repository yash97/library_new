class AddNameToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :name, :string
  end
end
