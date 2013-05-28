class PostsController < UITableViewController
  attr_accessor :posts

  def init
    self.posts = []
    self.title = 'test'
    super
  end

  def viewDidLoad
    load_data
    self.navigationItem.rightBarButtonItem = 
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemAdd,
        target: self, action: 'clickAddButton'
      )
    super
  end

  def tableView(tableView, numberOfRowsInSection:section)
    self.posts.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier('Cell') ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: 'Cell')
    cell.textLabel.text = posts[indexPath.row].title
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    post = posts[indexPath.row]
    self.navigationController.pushViewController(
      PostDetailController.alloc.initWithPost(post),
      animated: true
    )
  end

  def clickAddButton
    self.presentModalViewController(       
      UINavigationController.alloc.initWithRootViewController(
        PostModalController.new) , animated: true)
  end

  private
  def load_data
    Post.find_all do |_posts, response|
      if response.ok?
        @posts = _posts
        self.tableView.reloadData
      else
        App.alert(response.error_message)
      end
    end
  end

end
