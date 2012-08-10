=begin
  -------------------------------------
  OMG I AM STORING IMAGES IN THE DB!!!!
  -------------------------------------
  Why would I do such a thing?
  Because I am only storing a limited
  amount as attachments on articles,
  and I don't want to pay for an S3
  account to store them.
  -------------------------------------
=end
class Attachment < ActiveRecord::Base
  attr_accessible :data, :format, :name
  extend FriendlyId
  friendly_id :name
end
