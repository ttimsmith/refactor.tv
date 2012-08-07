class Episode < ActiveRecord::Base
  attr_accessible :notes, :position, :published_at, :seconds, :title
end
