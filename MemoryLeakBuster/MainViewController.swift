import UIKit
import XCGLogger
import RxSwift
import RxCocoa

class MainViewController: UIViewController, DeinitalizeNotifiable {

    @IBOutlet weak var button: UIButton!

    var disposeBag: DisposeBag = DisposeBag()
    var mainViewModel: MainViewModel!
    var onDeinitialized: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    deinit {
        onDeinitialized?()
        XCGLogger.debug("deinit")
    }

    func setUp() {
        // does not leak memory
        button.rx.tap
            .bind { [weak self] in
                self?.doesNotLeakMethod()
            }.disposed(by: disposeBag)


        // Uncomment to make the test fail and press CMD + U to run the tests.
        // ******THIS BINDING LEAKS MEMORY*****

//        button.rx.tap
//            .bind(onNext: leakingMethod)
//            .disposed(by: disposeBag)
    }

    func leakingMethod() {
        XCGLogger.debug("leaking")
    }

    func doesNotLeakMethod() {
        XCGLogger.debug("does not leak")
    }

}

