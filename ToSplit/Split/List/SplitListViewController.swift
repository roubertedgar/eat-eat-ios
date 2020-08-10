import UIKit
import Combine

class SplitListViewController: UIViewController {
    
    @IBOutlet weak var splitTableView: UITableView!
    
    private let viewModel = SplitListViewModel()
    
    private var bindings = Set<AnyCancellable>()
    private var splits: [Location] = Array()
    
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
    }
    
    private func setupSplitTableView(){
        splitTableView.register(SplitTableCell.nib, forCellReuseIdentifier: SplitTableCell.identifier)
        splitTableView.delegate = self
        splitTableView.dataSource = self
    }
    
    private func onLoadSplits(_ splits: [Location]) {
        self.splits = splits
        splitTableView.reloadData()
    }
}

extension SplitListViewController:UITableViewDelegate{
    
}

extension SplitListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return splits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SplitTableCell.identifier, for: indexPath) as! SplitTableCell
        let splitRow = splits[indexPath.row]
        
        cell.locationsTitle.text = splitRow.name
        
        return cell
    }
}
