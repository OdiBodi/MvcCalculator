class SubtractOperation: BasicOperation {
    override var title: String { "-" }
    override var font: OperationFont { .basic() }

    override func perform(model: MainModel) -> Bool {
        guard super.perform(model: model) else {
            return false
        }

        model.numbers[0] -= model.numbers[1]

        return true
    }
}
