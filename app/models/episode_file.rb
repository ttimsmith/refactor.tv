class EpisodeFile < ActiveRecord::Base
  attr_accessible :episode_id, :size, :file_type, :content_type, :url
  
  belongs_to :episode
  
  validates_presence_of :episode_id
end
