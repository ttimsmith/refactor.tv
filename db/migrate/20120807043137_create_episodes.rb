class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :notes
      t.datetime :published_at
      t.integer :seconds
      t.integer :position

      t.timestamps
    end
  end
end
