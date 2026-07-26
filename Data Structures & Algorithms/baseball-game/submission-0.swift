class Solution {
    func calPoints(_ operations: [String]) -> Int {
        let stack = Stack()
        operations.map {
            if $0 == "+" {
                stack.addLast()
            } else if $0 == "D" {
                stack.multiplyLast()
            } else if $0 == "C" {
                stack.pop()
            } else {
                if let num = Int($0) {
                    stack.push(num: num)
                } 
            }
        }
        return stack.finalSum()
    }

    class Stack {
        private var elements:[Int] = []

        func push(num: Int) {
            elements.append(num)
        }

        func pop() {
            elements.removeLast()
        }

        func finalSum() -> Int {
            return elements.reduce(0) {
                $0 + $1
            }
        }

        func addLast() {
            let count = elements.count
            elements.append(elements[count - 1] + elements[count - 2])
        }

        func multiplyLast() {
            elements.append(elements.last! * 2)
        }
    }
}
