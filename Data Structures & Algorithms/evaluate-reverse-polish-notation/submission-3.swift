class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack()
        let validOperators: Set<String> = ["+", "-", "*", "/"]
        for token in tokens {
            if validOperators.contains(token) {
                let op2 = stack.pop()
                let op1 = stack.pop()
                let result = performOperation(op1: op1, op2: op2, operand: token)
                stack.push(result)
            } else {
                stack.push(Int(token)!)
            }
        }

        return stack.peep()
    }

    func performOperation(op1: Int, op2: Int, operand: String) -> Int {
        switch operand {
            case "+":
                return op1 + op2
            case "-":
                return op1 - op2
            case "*":
                return op1 * op2
            case "/":
                return op1 / op2
            default:
                return op1 + op2
        }
    }

    class Stack {
        private var elements: [Int] = []

        func push(_ ele: Int) {
            elements.append(ele)
        }

        func pop() -> Int {
            return elements.removeLast()
        }

        func peep() -> Int{
            return elements.last!
        }
    }
}
