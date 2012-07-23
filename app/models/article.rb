class Article < ActiveRecord::Base
  attr_accessible :content, :title, :state, :published_at
  validates :title, :presence => true
  validates :content, :presence => true
  default_scope :order => 'published_at DESC'

  def self.published
    self.where(:state => 'public')
  end

  def public?
    self.state == 'public'
  end

end
