class RemoveUniversityFromLibraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :libraries, :university, :string
  end
end
