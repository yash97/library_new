class MigrationAnother < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :checkout, :books
    add_foreign_key :checkout, :student
  end
end
