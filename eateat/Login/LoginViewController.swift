import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTitleeText: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextImput: UITextField!
    @IBOutlet weak var passwordTextImput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews(){
        loginTitleeText.text = getString("loginScreenTitle")
        emailLabel.text = getString("emaiNameText")
        passwordLabel.text = getString("passwordText")
        
        emailTextImput.placeholder = getString("loginTextImputHint")
        passwordTextImput.placeholder = getString("passwordTextImputHint")
        
    }
    
    private func getString(_ key: String) -> String{
        return NSLocalizedString(key, comment: "")
    }
    
}
