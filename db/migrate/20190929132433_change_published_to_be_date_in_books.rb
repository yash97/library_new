class ChangePublishedToBeDateInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :published, :date
  end
end
