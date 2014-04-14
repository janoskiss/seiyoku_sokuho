class RenameNextCheckDeletionAtToNextDeletionDetectionAtOnVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :next_check_deletion_at, :next_deletion_detection_at
  end
end
