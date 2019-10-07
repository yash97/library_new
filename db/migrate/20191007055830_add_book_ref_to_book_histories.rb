class AddBookRefToBookHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_histories, :book, foreign_key: true
  end
end
