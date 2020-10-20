class ChangeImagetoArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :mixtapes, :image
  end
end
