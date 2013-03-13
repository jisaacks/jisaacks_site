class Comment < ActiveRecord::Base
  include Jisaacks::Commentable
  include Rakismet::Model
  rakismet_attrs :author => :name, :author_email => :email, :author_url => :website
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  attr_accessible :comment, :email, :name, :website, :spam_math
  attr_accessor :spam_math
  validates :name,    :presence => true
  validates :email,   :presence => true
  validates :comment, :presence => true
  validate :spam_math_is_correct
  after_create :notify

  def article
    if self.commentable_type == 'Article'
      self.commentable
    else
      self.commentable.article
    end
  end

  def notify
    Mailer.new_comment(self).deliver
  end

  private
  def spam_math_is_correct
     errors.add(:spam_math, 'needs a correct answer') unless self.spam_math.to_i == 7
  end
end
