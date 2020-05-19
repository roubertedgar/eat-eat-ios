import UIKit

class TextView: UILabel {
    
    @IBInspectable
    var localizedText: String = "" {
        didSet {
            self.text = getString(localizedText)
        }
    }
}
