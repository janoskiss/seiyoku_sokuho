class ChangeDeletedAtOnVideos < ActiveRecord::Migration
  def up
    change_column :videos, :deleted_at, :datetime
  end

  def down
    change_column :videos, :deleted_at, :timestamp
  end
end
