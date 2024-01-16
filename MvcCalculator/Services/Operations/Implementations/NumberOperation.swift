class NumberOperation: Operation {
    var title: String { String(number) }
    var font: OperationFont { .number() }

    private let number: Int

    init(number: Int) {
        self.number = number
    }

    func perform(model: MainModel) -> Bool {
        let oldNumber = model.number
        let newNumberString = "\(oldNumber)\(number)"

        guard newNumberString.count < 10 else {
            return false
        }

        model.number = Int(newNumberString) ?? oldNumber

        return true
    }
}
