class Episode < ActiveRecord::Base
  attr_accessible :notes, :position, :published_at, :seconds, :title, :summary
  
  has_many :episode_files
  
  validates_presence_of :position
  validates_uniqueness_of :position
  
  def to_param
    self.position
  end
end
