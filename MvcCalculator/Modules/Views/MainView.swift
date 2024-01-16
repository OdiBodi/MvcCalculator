import UIKit
import Combine

class MainView: UIView {
    private lazy var outputLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.text = "0"
        label.textColor = R.color.operation.numberColor()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 75, weight: .regular)
        return label
    }()

    private lazy var operationsView: OperationsView = {
        let view = OperationsView()

        view.operationCellTapped.sink { [weak self] in
            self?.controller?.performOperation(byIndex: $0)
        }.store(in: &subscriptions)

        return view
    }()

    private var controller: MainViewController?
    private var subscriptions: Set<AnyCancellable> = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Life cycle

extension MainView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSubviewsConstraints()
    }
}

// MARK: - Initializators

extension MainView {
    func initialize(model: MainModel, controller: MainViewController) {
        self.controller = controller

        model.$numbers.sink { [weak self] numbers in
            let index = model.numberIndex
            let number = numbers[index]
            self?.outputLabel.text = String(number)
        }.store(in: &subscriptions)
    }
}

// MARK: - Configurators

extension MainView {
    func configureView() {
        backgroundColor = R.color.backgroundColor()
    }
}

// MARK: - Subviews

extension MainView {
    private func addSubviews() {
        addSubview(outputLabel)
        addSubview(operationsView)
    }

    private func updateSubviewsConstraints() {
        outputLabel.snp.updateConstraints { maker in
            maker.left.right.equalToSuperview().inset(35)
            maker.height.equalTo(100)
            maker.bottom.equalTo(operationsView.snp.top)
        }
        operationsView.snp.updateConstraints { maker in
            maker.left.right.equalToSuperview()
            maker.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            maker.height.equalTo(operationsView.height(by: bounds))
        }
    }
}
