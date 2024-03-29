import UIKit
import Combine

class OperationsView: UIView {
    private lazy var collectionView = initializeCollectionView()

    private let operationCellTappedSubject = PassthroughSubject<Int, Never>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Publishers

extension OperationsView {
    var operationCellTapped: AnyPublisher<Int, Never> {
        operationCellTappedSubject.eraseToAnyPublisher()
    }
}

// MARK: - Life cycle

extension OperationsView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSubviewsConstraints()
    }
}

// MARK: - Subviews

extension OperationsView {
    private func initializeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.backgroundColor = R.color.backgroundColor()
        view.register(OperationViewCell.self, forCellWithReuseIdentifier: OperationViewCell.id)

        return view
    }

    private func addSubviews() {
        addSubview(collectionView)
    }

    private func updateSubviewsConstraints() {
        collectionView.snp.updateConstraints { maker in
            maker.top.bottom.left.right.equalToSuperview()
        }
    }
}

// MARK: - Helpers

extension OperationsView {
    func cellSize(by bounds: CGRect) -> CGFloat {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let contentInset = collectionView.contentInset
        let width = bounds.width
        let inset = contentInset.left + contentInset.right
        let spacing = layout.minimumInteritemSpacing * (4 - 1)
        let size = (width - inset - spacing) / 4
        return size
    }

    func height(by bounds: CGRect) -> CGFloat {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let contentInset = collectionView.contentInset
        let inset = contentInset.top + contentInset.bottom
        let spacing = layout.minimumLineSpacing * (5 - 1)
        let cellsSize = cellSize(by: bounds) * 5
        let height = inset + spacing + cellsSize
        return height
    }
}

// MARK: - UICollectionViewDataSource

extension OperationsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MainModel.operations.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OperationViewCell.id,
                                                      for: indexPath) as! OperationViewCell
        let index = indexPath.item
        let operation = MainModel.operations[index]
        cell.initialize(operation: operation)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension OperationsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        operationCellTappedSubject.send(index)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OperationsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = cellSize(by: bounds)

        var cellWidth = cellSize
        let cellHeight = cellSize

        let index = indexPath.item
        let operation = MainModel.operations[index]
        if let numberOperation = operation as? NumberOperation, numberOperation.title == "0" {
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let cellsWidth = cellWidth * 2
            let spacing = layout.minimumInteritemSpacing * 2
            cellWidth += cellsWidth + spacing
        }

        return CGSize(width: cellWidth, height: cellHeight)
    }
}
