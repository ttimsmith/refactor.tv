require 'redcarpet'

class Episode < ActiveRecord::Base
  attr_accessible :notes, :position, :published_at, :seconds, :title, :summary

  has_many :episode_files

  validates_presence_of :position, :title, :summary, :notes, :seconds
  validates_uniqueness_of :position, :title

  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('position DESC')

  before_save :update_notes_html

  def to_param
    self.position
  end

  def padded_position
    self.position.to_s.rjust(3, '0')
  end

  def published?
    self.published_at and self.published_at <= Time.now.utc
  end

  def update_file_sizes(sizes)
    # HD
    if size = sizes[:hd_size]
      self.hd_video_file_size = size
    end

    # SD
    if size = sizes[:sd_size]
      self.sd_video_file_size = size
    end

    # Audio
    if size = sizes[:audio_size]
      self.audio_file_size = size
    end
  end

  def hd_video_file_size
    get_file_size('video-720')
  end

  def hd_video_file_size=(size)
    set_file_size('video-720', size, 'video/mp4', '720.mp4')
  end

  def sd_video_file_size
    get_file_size('video-480')
  end

  def sd_video_file_size=(size)
    set_file_size('video-480', size, 'video/mp4', '480.mp4')
  end

  def audio_file_size
    get_file_size('audio-m4a')
  end

  def audio_file_size=(size)
    set_file_size('audio-m4a', size, 'audio/mp4a-latm', 'audio.m4a')
  end

private

  def update_notes_html
    return if self.notes.blank?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      superscript: true
    })
    self.notes_html = markdown.render(self.notes)
  end

  def get_file_size(type)
    file = self.episode_files.where(file_type: type).first
    return nil unless file
    file.size
  end

  def set_file_size(type, size, content_type, suffix)
    if file = self.episode_files.where(file_type: type).first
      file.size = size
      file.save
    else
      url = url = "http://download.refactor.tv/episodes/#{self.padded_position}/Episode#{self.padded_position}-#{suffix}"
      unless file = EpisodeFile.create(episode_id: self.id, file_type: type, content_type: content_type, url: url, size: size)
        raise file.errors.inspect
      end
    end
    file
  end
end
