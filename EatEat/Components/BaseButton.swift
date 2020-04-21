import UIKit

class BaseButton:UIButton{
    
    @IBInspectable
    var localizedTitle:String = ""{
        didSet{
            self.setTitle(getString(localizedTitle), for: .normal)
        }
    }
}
