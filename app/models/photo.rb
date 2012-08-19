class Photo < ActiveRecord::Base
  attr_accessible :info
  serialize :info, HashWithIndifferentAccess
end
