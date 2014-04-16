class AddNextCheckDeletionAtToVideos < ActiveRecord::Migration
  def up
    add_column :videos, :next_check_deletion_at, :datetime

    execute("select id from videos").each do |video|
      next_check_deletion_at = Time.now + 24.hours + rand(24.hours)

      sql = ["update videos set next_check_deletion_at = ? where id = ?", next_check_deletion_at, video["id"]]
      execute(ActiveRecord::Base.__send__(:sanitize_sql_array, sql))
    end
  end

  def down
    remove_column :videos, :next_check_deletion_at
  end
end
