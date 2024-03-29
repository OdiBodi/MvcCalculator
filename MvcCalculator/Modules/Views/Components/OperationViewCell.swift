import UIKit
import SnapKit

class OperationViewCell: UICollectionViewCell {
    private lazy var titleLabel = initializeTitleLabel()

    private var animation: OperationCellAnimation?

    override init(frame: CGRect) {
        super.init(frame: frame)
        animation = OperationCellAnimation(cell: self)
        configureView()
        addSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Static

extension OperationViewCell {
    static let id = "\(OperationViewCell.self)"
}

// MARK: - Life cycle

extension OperationViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSubviewsConstraints()
    }
}

// MARK: - Intializators

extension OperationViewCell {
    func initialize(operation: Operation) {
        configureTitleLabel(operation: operation)
    }
}

// MARK: - Configurators

extension OperationViewCell {
    private func configureView() {
        backgroundColor = R.color.backgroundColor()

        layer.cornerRadius = min(bounds.width, bounds.height) / 4
        layer.shadowOpacity = 1
        layer.shadowRadius = 6
        layer.shadowOffset = .zero

        configureViewLayerShadowColor()
    }

    private func configureViewLayerShadowColor() {
        let shadowColor = R.color.operation.shadowColor()?.cgColor
        layer.shadowColor = shadowColor ?? UIColor.red.cgColor
    }

    private func configureTitleLabel(operation: Operation) {
        titleLabel.text = operation.title
        titleLabel.textColor = operation.font.color
        titleLabel.font = operation.font.font
    }
}

// MARK: - Subviews

extension OperationViewCell {
    private func initializeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func updateSubviewsConstraints() {
        titleLabel.snp.updateConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.height.equalToSuperview().inset(10)
        }
    }
}

// MARK: - Trait collection

extension OperationViewCell {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureViewLayerShadowColor()
    }
}

// MARK: - Touches

extension OperationViewCell {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animation?.touch()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animation?.untouch()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animation?.untouch()
    }
}
