class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary
  
  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order('created_at DESC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  
  
  def markdown_title
    render_as_markdown(title)
  end
  
  def markdown_body
    render_as_markdown(body)
  end
  
  private
  
  def render_as_markdown(attribute)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render attribute).html_safe
  end
end