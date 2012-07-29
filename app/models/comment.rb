class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :comment, :email, :name, :website
  validates :name,    :presence => true
  validates :email,   :presence => true
  validates :comment, :presence => true
end
