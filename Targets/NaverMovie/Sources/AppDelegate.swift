import UIKit
import RIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  private var launchRouting: LaunchRouting?
  private let launchComponent = AppComponent()
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    launchRouting = RootBuilder(dependency: launchComponent).build()
    launchRouting?.launch(from: window!)
    return true
  }
  
}
