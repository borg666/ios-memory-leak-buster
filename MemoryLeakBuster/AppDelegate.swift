import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setRootViewController(to: window)
        return true
    }


    private func setRootViewController(to window: UIWindow?) {
        let storyboardName: String = "\(MainViewController.self)"
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let mainViewController: MainViewController = storyboard.instantiateViewController(
            withIdentifier: storyboardName) as! MainViewController
        mainViewController.mainViewModel = MainViewModel()
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.makeKeyAndVisible()
    }

}

