class MinStack {
    struct Element {
        let val: Int
        let prevMin: Int
    }

    private var elements: [Element] = []
    private var min: Int = 0

    init() {

    }

    func push(_ val: Int) {
        let element: Element
        if elements.isEmpty {
            element = Element(val: val, prevMin: val)
            min = val
        } else {
            element = Element(val: val, prevMin: min)
            if (val < min) {
                min = val
            }
        }
        elements.append(element)
    }

    func pop() {
        let element = elements.removeLast()
        min = element.prevMin
    }

    func top() -> Int {
        return elements.last!.val
    }

    func getMin() -> Int {
        return min
    }
}
