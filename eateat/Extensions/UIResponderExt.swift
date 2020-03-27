
import UIKit

extension UIResponder{
    
    func getString(_ key: String) -> String{
        return NSLocalizedString(key, comment: "")
    }
}
