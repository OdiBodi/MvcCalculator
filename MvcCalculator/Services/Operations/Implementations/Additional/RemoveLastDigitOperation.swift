class RemoveLastDigitOperation: Operation {
    var title: String { "<" }
    var font: OperationFont { .additional() }

    func perform(model: MainModel) -> Bool {
        model.number /= 10
        return true
    }
}
