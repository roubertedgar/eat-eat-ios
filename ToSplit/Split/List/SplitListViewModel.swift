import Foundation
import Combine

class SplitListViewModel{
    
    private var bindings = Set<AnyCancellable>()

    @Published private(set) var splits: Array<Location> = Array()
    
    func loadSplits(){
        SplitHttpClient().fetchSplits()
            .sink(receiveCompletion: { _ in
                       print("")
                }, receiveValue: { value in
                    self.splits = value
                }).store(in: &bindings)
    }
}
