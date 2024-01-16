class BasicOperation: Operation {
    var title: String { "" }
    var font: OperationFont { OperationFont.basic() }

    func perform(model: MainModel) -> Bool {
        guard model.number != 0 else {
            return false
        }

        guard model.resultOperation === self else {
            model.resultOperation = self
            model.numberIndex = 1
            return false
        }

        model.numberIndex = 0

        guard validNumber(in: model) else {
            return false
        }

        return true
    }
}

// MARK: - Helpers

extension BasicOperation {
    private func validNumber(in model: MainModel) -> Bool {
        let number = model.number
        let numberString = String(number)
        return numberString.count < 10
    }
}
