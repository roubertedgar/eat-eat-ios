import UIKit
import Combine

class SplitListViewController: UIViewController {
    
    @IBOutlet weak var splitTableView: UITableView!
    
    private let viewModel = SplitListViewModel()
    
    private var bindings = Set<AnyCancellable>()
    private var tableViewController = SplitTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSplitTableView()
        setupObservers()
        viewModel.loadSplits()
        
    }
    
    private func setupObservers(){
        viewModel.$splits
            .sink(receiveValue: {splits in
                self.onLoadSplits(splits)
            }).store(in: &bindings)
        
        tableViewController.didSelectSplit { Location in
            print(Location)
        }
    }
    
    private func setupSplitTableView(){
        splitTableView.register(SplitTableCell.nib, forCellReuseIdentifier: SplitTableCell.identifier)
        splitTableView.delegate = tableViewController
        splitTableView.dataSource = tableViewController
    }
    
    private func onLoadSplits(_ splits: [Location]) {
        tableViewController.splits = splits
        splitTableView.reloadData()
    }
}

class SplitTableViewController:NSObject, UITableViewDelegate, UITableViewDataSource{

    var splits: [Location] = Array()
    private var didSelected: (Location)-> Void = {(split) in}
    
    func didSelectSplit(_ didSelected:@escaping (Location)-> Void){
        self.didSelected = didSelected
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return splits.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelected(splits[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SplitTableCell.identifier, for: indexPath) as! SplitTableCell
        let splitRow = splits[indexPath.row]
        
        cell.locationsTitle.text = splitRow.name
        
        return cell
    }
    

}
