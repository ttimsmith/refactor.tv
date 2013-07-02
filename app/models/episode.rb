class Episode < ActiveRecord::Base
  attr_accessible :notes, :position, :published_at, :seconds, :title, :summary

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

private

  def update_notes_html
    return if self.notes.blank?

    require 'redcarpet'

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
