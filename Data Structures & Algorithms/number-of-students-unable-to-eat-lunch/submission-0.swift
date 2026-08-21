class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        class Node {
            let value: Int
            var next: Node?

            init(_ value: Int) {
                self.value = value
            }
        }

        var circularDemand = 0
        var squareDemand = 0
        var head: Node?
        var tail: Node?


        for student in students {
            if student == 0 {
                circularDemand += 1
            } else {
                squareDemand += 1
            }
        }

        for student in students.reversed() {
            let node = Node(student)
            if head == nil {
                head = node
                tail = node
            } else {
                tail?.next = node
                tail = node
            }
        }

        var canRequirementBeSatisfied = true
        var availableSandwiches = Array(sandwiches.reversed())
        while(canRequirementBeSatisfied && availableSandwiches.count != 0) {
            let currentDemand = head!.value
            let topSandwich = availableSandwiches.last!
            if topSandwich == currentDemand {
                let next = head?.next
                head?.next = nil
                head = next
                availableSandwiches.removeLast()
                currentDemand == 0 ? (circularDemand -= 1) : (squareDemand -= 1)
            } else {
                if ((topSandwich == 0 && circularDemand != 0) || (topSandwich == 1 && squareDemand != 0)) {
                let cur = head
                head = head?.next
                cur?.next = nil
                tail?.next = cur
                tail = cur
            } else {
                canRequirementBeSatisfied = false
            }
            }
        }
        return circularDemand + squareDemand
    }
}