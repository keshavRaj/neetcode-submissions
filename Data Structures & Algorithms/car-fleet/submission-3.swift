
    struct Car: Comparable {
        let position: Int
        let arrivalTime: Decimal

        static func < (lhs: Car, rhs: Car) -> Bool {
            return lhs.position < rhs.position
        }
    }
    class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
       let cars: [Car] = zip(position, speed).map { 
            let arrivalTime = (Decimal(target) - Decimal($0)) / Decimal($1)
            return Car(position: $0, arrivalTime: arrivalTime)
       }
       let sortedByPos = cars.sorted{ $0 > $1 }
       var fleetCount = 0
       var lastArrivalTimeEncountered: Decimal?
       for car in sortedByPos {
           if let lastArrivalTime = lastArrivalTimeEncountered {
                if lastArrivalTime < car.arrivalTime {
                    lastArrivalTimeEncountered = car.arrivalTime
                    fleetCount += 1
                }
           } else {
            lastArrivalTimeEncountered = car.arrivalTime
            fleetCount += 1
           }
       }
       return fleetCount
    }
}
