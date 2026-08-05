class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var maxSpeed = 0
        for pile in piles {
            if pile > maxSpeed {
                maxSpeed = pile
            }
        }
        var slowestSpeed = 1
        var lowestEatingSpeed = 1
        while(slowestSpeed <= maxSpeed) {
            let mid = (maxSpeed + slowestSpeed) / 2
            var currentTime = 0
            for pile in piles {
                let time = pile % mid == 0 ? pile / mid : (pile / mid) + 1
                currentTime += time
            }
            if currentTime > h {
                slowestSpeed = mid + 1
            } else {
                maxSpeed = mid - 1
                lowestEatingSpeed = mid 
            }
        }
        return lowestEatingSpeed
    }
}
