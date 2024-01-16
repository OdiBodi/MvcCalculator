import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var model: MainModel?
}

// MARK: - Initializators

extension MainViewController {
    func initialize(model: MainModel, view: MainView) {
        self.model = model
        self.view = view
    }
}

// MARK: - Operations

extension MainViewController {
    func performOperation(byIndex index: Int) {
        guard let model = model else {
            return
        }

        let operation = MainModel.operations[index]
        operation.perform(model: model)
    }
}
