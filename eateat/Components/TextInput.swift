import UIKit

class TextInput: UITextField{
    
    @IBInspectable
    var localizedPlaceholder: String = ""{
        didSet{
            self.placeholder = getString(localizedPlaceholder)
        }
    }
}
