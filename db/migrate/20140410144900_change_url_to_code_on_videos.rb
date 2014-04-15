class ChangeUrlToCodeOnVideos < ActiveRecord::Migration
  def up
    execute("select id, url from videos").each do |video|
      code = video["url"].slice(/(?<=\/video)\d+/)
      execute("update videos set url = '#{code}' where id = #{video["id"]}")
    end

    rename_column :videos, :url, :code
    change_column :videos, :code, :string, limit: 16
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
