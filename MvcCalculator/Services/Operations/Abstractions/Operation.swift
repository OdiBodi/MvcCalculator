import UIKit

protocol Operation: AnyObject {
    var title: String { get }
    var font: OperationFont { get }

    func perform(model: MainModel) -> Bool
}
