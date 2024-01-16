extension MainModel {
    static let operations: [Operation] = [
        ClearOperation(), RemoveLastDigitOperation(), SignOperation(), DivideOperation(),
        NumberOperation(number: 7), NumberOperation(number: 8), NumberOperation(number: 9), MultiplyOperation(),
        NumberOperation(number: 4), NumberOperation(number: 5), NumberOperation(number: 6), SubtractOperation(),
        NumberOperation(number: 1), NumberOperation(number: 2), NumberOperation(number: 3), AddOperation(),
        NumberOperation(number: 0), ResultOperation()
    ]
}
