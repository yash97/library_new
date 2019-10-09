class MigrationName < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :bookmarks, :students
    add_foreign_key :bookmarks, :books
  end
end
