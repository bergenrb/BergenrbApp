class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = MainController.alloc.init
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(controller)

    true
  end
end
