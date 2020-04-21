import UIKit

class SplashViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(LoginViewController(), animated: true)
        navigationController?.viewControllers.remove(at: 0)
    }
}
