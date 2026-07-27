class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let stack = Stack()
        var results = Array(repeating: 0, count: temperatures.count) 
        for (index,temp) in temperatures.enumerated() {
            while(true) {
                if let storedIndex = stack.peek() {
                    if temperatures[storedIndex] < temp {
                        results[storedIndex] = index - storedIndex
                        stack.pop()
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            stack.push(index)
        }
        return results
    }

    class Stack {
        private var elements: [Int] = []

        func push(_ ele: Int) {
            elements.append(ele)
        }

        func pop() -> Int? {
            return elements.popLast()
        }

        func peek() -> Int? {
            return elements.last
        }
    }
}
