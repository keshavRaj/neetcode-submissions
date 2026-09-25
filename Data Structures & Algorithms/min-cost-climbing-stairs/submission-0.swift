class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        if cost.count == 2 {
            return min(cost[0], cost[1])
        }
        var i = 2
        var costs = [cost[0], cost[1]]
        while(i < cost.count) {
            let temp = costs[1]
            let currentJumpCost = min(costs[0], costs[1]) + cost[i]
            costs[1] = currentJumpCost
            costs[0] = temp
            i += 1
        }
        return min(costs[0], costs[1])
    }
}
