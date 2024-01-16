class ClearOperation: Operation {
    var title: String { "C" }
    var font: OperationFont { .additional() }

    func perform(model: MainModel) -> Bool {
        model.reset()
        return true
    }
}
