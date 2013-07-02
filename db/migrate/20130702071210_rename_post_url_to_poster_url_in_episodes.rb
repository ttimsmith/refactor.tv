class RenamePostUrlToPosterUrlInEpisodes < ActiveRecord::Migration
  def change
    rename_column :episodes, :post_url, :poster_url
  end
end
