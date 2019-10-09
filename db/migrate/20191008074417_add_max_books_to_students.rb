class AddMaxBooksToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :max_books, :integer
  end
end
