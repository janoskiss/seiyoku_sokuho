class ChangeUrlToCodeOnVideos < ActiveRecord::Migration
  def up
    execute("select id, url from videos").each do |video|
      code = video["url"].slice(/(?<=\/video)\d+/)

      sql = ["update videos set url = ? where id = ?", code, video["id"]]
      execute(ActiveRecord::Base.__send__(:sanitize_sql_array, sql))
    end

    rename_column :videos, :url, :code
    change_column :videos, :code, :string, limit: 16
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
