import Combine

class MainModel {
    @Published var numbers: [Int] = [0, 0]
    var numberIndex: Int = 0
    var resultOperation: Operation?
}

// MARK: - Helpers

extension MainModel {
    var number: Int {
        get {
            numbers[numberIndex]
        }
        set {
            numbers[numberIndex] = newValue
        }
    }
}

// MARK: - Utilites

extension MainModel {
    func reset() {
        numbers = [0, 0]
        numberIndex = 0
        resultOperation = nil
    }
}
