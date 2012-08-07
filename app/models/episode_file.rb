class EpisodeFile < ActiveRecord::Base
  attr_accessible :episode_id, :size, :type, :url
end
