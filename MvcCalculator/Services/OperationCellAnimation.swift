import UIKit

class OperationCellAnimation {
    private let cell: OperationCell
    private var animator: UIViewPropertyAnimator?

    init(cell: OperationCell) {
        self.cell = cell
    }

    func touch() {
        animate(duration: 0.1,
                scale: 0.95,
                backgroundColor: R.color.operation.shadowColor() ?? .red,
                shadowOpacity: 0)
    }

    func untouch() {
        animate(duration: 0.2,
                scale: 1,
                backgroundColor: R.color.backgroundColor() ?? .red,
                shadowOpacity: 1)
    }

    private func animate(duration: TimeInterval, scale: CGFloat, backgroundColor: UIColor, shadowOpacity: Float) {
        animator?.stopAnimation(true)

        animator = UIViewPropertyAnimator(duration: duration, curve: .easeOut) { [weak self] in
            self?.cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            self?.cell.backgroundColor = backgroundColor
            self?.cell.layer.shadowOpacity = shadowOpacity
        }
        animator?.addCompletion { [weak self] _ in
            self?.animator = nil
        }

        animator?.startAnimation()
    }
}
