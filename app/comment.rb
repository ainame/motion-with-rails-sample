class Comment < MotionResource::Base
  attr_accessor :id, :post_id, :body
  belongs_to :post

  self.collection_url = "comments"
  self.member_url = "comments/:id"
end
