class RemoveAssociatedLibraryFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :associated_library, :string
  end
end
