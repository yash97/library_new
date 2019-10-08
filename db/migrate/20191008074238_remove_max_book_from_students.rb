class RemoveMaxBookFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :max_book, :integer
  end
end
