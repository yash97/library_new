class CreateHoldRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :hold_requests do |t|
      t.integer :student_id
      t.integer :book_id

      t.timestamps
    end
  end
end
