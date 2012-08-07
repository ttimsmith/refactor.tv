class CreateEpisodeFiles < ActiveRecord::Migration
  def change
    create_table :episode_files do |t|
      t.integer :episode_id
      t.string :type
      t.integer :size
      t.string :url

      t.timestamps
    end
  end
end
