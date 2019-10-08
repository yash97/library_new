class AddUniversityToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :university, :string
  end
end
