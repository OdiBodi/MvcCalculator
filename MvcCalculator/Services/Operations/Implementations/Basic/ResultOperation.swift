class ResultOperation: Operation {
    var title: String { "=" }
    var font: OperationFont { .basic() }

    func perform(model: MainModel) -> Bool {
        model.resultOperation?.perform(model: model) ?? false
    }
}
