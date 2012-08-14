class EpisodeFile < ActiveRecord::Base
  attr_accessible :episode_id, :size, :file_type, :content_type, :url

  belongs_to :episode

  validates_presence_of :episode_id

  def display_name
    case self.file_type
    when 'video-720'
      'HD Video'
    when 'video-480'
      'SD Video'
    when 'audio-m4a'
      'Audio'
    end
  end
end
