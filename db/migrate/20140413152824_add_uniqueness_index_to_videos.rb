class AddUniquenessIndexToVideos < ActiveRecord::Migration
  def change
    add_index :videos, :code, unique: true
  end
end
