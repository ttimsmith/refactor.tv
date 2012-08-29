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
end
