class PostDetailController < UIViewController
  def initWithPost(post)
    @post = post
    init
  end

  def viewDidLoad
    super
    self.title = @post.title
    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.new.tap do |l|
      l.frame = CGRectZero
      l.text = @post.body
      l.sizeToFit
      l.lineBreakMode
    end
    self.view.addSubview(@label)
  end
end
