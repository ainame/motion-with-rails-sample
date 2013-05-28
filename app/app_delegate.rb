class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    MotionResource::Base.root_url = "http://localhost:3000/"
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds).tap do |w|
      w.rootViewController = UINavigationController.alloc.
        initWithRootViewController(PostsController.alloc.init)
      w.makeKeyAndVisible
    end
  end
end
