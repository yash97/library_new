class CreateBookHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.datetime :issue_date
      t.datetime :return_date
      t.boolean :is_checked_out
      t.boolean :on_hold
      t.decimal :fine_amt
      t.boolean :is_approved

      t.timestamps
    end
  end
end
