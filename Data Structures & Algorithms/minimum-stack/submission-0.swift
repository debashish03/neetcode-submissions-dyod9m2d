class MinStack {

    private var stack: [(val: Int, min: Int)] = []
    init() {
    }

    func push(_ val: Int) {
        let minValue = stack.isEmpty ? val : min(val, stack.last!.min)
        stack.append((val: val, min: minValue))
    }

    func pop() {
        self.stack.removeLast()
    }

    func top() -> Int {
        self.stack.last!.val
    }

    func getMin() -> Int {
        self.stack.last!.min
    }
}
