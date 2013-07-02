class MoveToVimeo < ActiveRecord::Migration
  def change
    drop_table :episode_files
    add_column :episodes, :vimeo_id, :integer
    add_column :episodes, :post_url, :string
  end
end
