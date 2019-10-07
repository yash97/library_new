class AddBookRefToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookmarks, :book, foreign_key: true
  end
end
