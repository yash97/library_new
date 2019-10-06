class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :language
      t.string :published
      t.string :edition
      t.string :associated_library
      t.string :subject
      t.text :summary
      t.boolean :special

      t.timestamps
    end
  end
end
