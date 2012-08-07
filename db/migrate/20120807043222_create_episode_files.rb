class CreateEpisodeFiles < ActiveRecord::Migration
  def change
    create_table :episode_files do |t|
      t.integer :episode_id
      t.string :file_type
      t.string :content_type
      t.integer :size
      t.string :url

      t.timestamps
    end
    
    add_index :episode_files, :episode_id
  end
end
