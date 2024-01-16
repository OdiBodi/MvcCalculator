class SignOperation: Operation {
    var title: String { "+-" }
    var font: OperationFont { .additional() }

    func perform(model: MainModel) -> Bool {
        model.number *= -1
        return true
    }
}
