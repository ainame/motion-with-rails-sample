class PostModalController < UIViewController
  def viewDidLoad
    super
    @edit_view = create_edit_view

    self.navigationItem.title = "post" 
    self.navigationItem.rightBarButtonItem = 
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemDone,
        target: self, action: 'clickDoneButton'
      )
    self.navigationItem.leftBarButtonItem = 
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemCancel,
      target: self, action: 'clickCancelButton'
      )
    self.view.addSubview @edit_view
  end
  
  def clickDoneButton
    create_post(@edit_view.text) if @edit_view.hasText
    self.dismissModalViewControllerAnimated(true)
  end

  def clickCancelButton
    self.dismissModalViewControllerAnimated(true)
  end

  private
  def create_edit_view
    UITextView.alloc.init.tap do |v|
      v.frame = self.view.bounds
      v.backgroundColor = UIColor.whiteColor
      v.font = UIFont.systemFontOfSize 16
    end    
  end

  def create_post(text)
    Post.create(title: "title", body: text)
  end

end
