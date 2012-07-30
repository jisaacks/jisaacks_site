module Jisaacks
  module Commentable
    def comment_count
      count = self.comments.count
      self.comments.each do |c|
        count += c.comment_count
      end
      count
    end
  end
end