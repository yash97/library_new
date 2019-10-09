class Anymigration < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :hold_requests,:books
    add_foreign_key :hold_requests,:students
  end
end
