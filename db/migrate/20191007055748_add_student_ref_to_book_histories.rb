class AddStudentRefToBookHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_histories, :student, foreign_key: true
  end
end
