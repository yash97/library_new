class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.integer :student_id
      t.integer :book_id
      t.date :issue_date
      t.date :return_date
      t.integer :validity

      t.timestamps
    end
  end
end
