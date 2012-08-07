class AddNotesHtmlToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :notes_html, :text
  end
end
