extension OperationFont {
    static func number() -> OperationFont {
        OperationFont(color: R.color.operation.numberColor() ?? .red,
                      font: .systemFont(ofSize: 30, weight: .regular))
    }

    static func basic() -> OperationFont {
        OperationFont(color: R.color.operation.basicColor() ?? .red,
                      font: .systemFont(ofSize: 30, weight: .bold))
    }

    static func additional() -> OperationFont {
        OperationFont(color: R.color.operation.additionalColor() ?? .red,
                      font: .systemFont(ofSize: 30, weight: .bold))
    }
}
