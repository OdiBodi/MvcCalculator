import UIKit

protocol Operation: AnyObject {
    var title: String { get }
    var font: OperationFont { get }

    @discardableResult
    func perform(model: MainModel) -> Bool
}
