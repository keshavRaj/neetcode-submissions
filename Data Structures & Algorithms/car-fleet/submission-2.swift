class Solution {
    struct Car: Comparable {
        let position: Int
        let arrivalTime: Decimal

        static func < (lhs: Car, rhs: Car) -> Bool {
            return lhs.position < rhs.position
        }
    }
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
       let cars: [Car] = zip(position, speed).map { 
            let arrivalTime = (Decimal(target) - Decimal($0)) / Decimal($1)
            return Car(position: $0, arrivalTime: arrivalTime)
       }
       let sortedByPos = cars.sorted{ $0 > $1 }
       let stack = Stack()
       var fleetCount = 0
       for car in sortedByPos {
            if let arrivalTime = stack.peek() {
                if arrivalTime < car.arrivalTime {
                    stack.push(car.arrivalTime)
                }
            } else {
                stack.push(car.arrivalTime)
            }
       }

       while let _ = stack.pop() {
            fleetCount += 1
       }
       return fleetCount
    }

    class Stack {
        var elements: [Decimal] = []

        func push(_ ele: Decimal) {
            elements.append(ele)
        }

        func pop() -> Decimal? {
            elements.popLast()
        }

        func peek() -> Decimal? {
            return elements.last
        }
    }
}
