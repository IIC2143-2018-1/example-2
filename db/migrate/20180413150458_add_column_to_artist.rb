class AddColumnToArtist < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :year, :integer
  end
end
