import Quick
import Nimble
import RxSwift

@testable import MemoryLeakBuster

class MainViewControllerSpec: QuickSpec {

    override func spec() {
        describe("MainViewController") {
            context("when main view controller instance is set to nil") {
                var isDeinitCalled: Bool = false
                var mainViewController: MainViewController!

                beforeEach {
                    waitUntil(timeout: 5.0) { done in
                        let storyboardName: String = "\(MainViewController.self)"
                        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)

                        mainViewController = storyboard.instantiateViewController(
                            withIdentifier: storyboardName) as! MainViewController
                        mainViewController.mainViewModel = MainViewModel()

                        _ = mainViewController.view
                        
                        mainViewController.onDeinitialized = {
                            done()
                            isDeinitCalled = true
                        }
                        mainViewController = nil
                    }
                }

                it("deinit called") {
                    expect(isDeinitCalled).to(beTrue())
                }
            }
        }
    }

}
