class Post < MotionResource::Base
  attr_accessor :id
  attribute :title, :body
  has_many :comments

  self.collection_url = "posts"
  self.member_url     = "posts/:id"
end
