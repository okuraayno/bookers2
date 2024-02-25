class ChangeBookComentsToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :book_coments, :book_comments
  end
end
