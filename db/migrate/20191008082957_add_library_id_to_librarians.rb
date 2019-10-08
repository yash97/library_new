class AddLibraryIdToLibrarians < ActiveRecord::Migration[5.2]
  def change
    add_reference :librarians, :library, foreign_key: true
  end
end
