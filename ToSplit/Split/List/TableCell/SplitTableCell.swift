import UIKit

class SplitTableCell: UITableViewCell {
    
    static let identifier = "SplitTableCell"

    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var locationsTitle: UILabel!
}
