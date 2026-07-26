class Solution {
    func isValid(_ s: String) -> Bool {
        let paraStack = Stack()
        for char in s {
            if paraStack.isEmpty() {
                paraStack.push(char)
            } else {
                let braces = paraStack.peep()!
                if ((char == Character(")") && braces == Character("(")) 
                || (char == Character("}") && braces == Character("{"))
                || (char == Character("]") && braces == Character("["))) {
                    paraStack.pop()
                } else {
                    paraStack.push(char)
                }
            }
        }
        return paraStack.isEmpty()

    }

    class Stack {
        private var elements:[Character] = []

        func push(_ ele: Character) {
            elements.append(ele)
        }

        func pop() -> Character? {
            return elements.popLast()
        }

        func peep() -> Character? {
            return elements.last
        }

        func isEmpty() -> Bool {
            return elements.isEmpty
        }
    }
}
