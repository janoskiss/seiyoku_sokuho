class AddNextCheckDeletionAtToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :next_check_deletion_at, :datetime
  end
end
