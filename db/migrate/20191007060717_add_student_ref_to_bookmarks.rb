class AddStudentRefToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookmarks, :student, foreign_key: true
  end
end
