class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
