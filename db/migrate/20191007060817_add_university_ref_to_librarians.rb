class AddUniversityRefToLibrarians < ActiveRecord::Migration[5.2]
  def change
    add_reference :librarians, :university, foreign_key: true
  end
end
