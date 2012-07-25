class Article < ActiveRecord::Base
  attr_accessible :content, :title, :state, :published_at
  validates :title, :presence => true
  validates :content, :presence => true
  default_scope :order => 'published_at DESC'

  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.published
    self.where(:state => 'public')
  end

  def public?
    self.state == 'public'
  end

  def self.recent
    self.published.limit(10)
  end

  def should_generate_new_friendly_id?
    new_record?
  end

end
