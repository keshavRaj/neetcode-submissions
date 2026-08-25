class Solution {
    var ways: [Int: Int] = [1: 1, 2: 2]
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var oneStepWays = ways[n - 1]
        if oneStepWays == nil {
           let result = climbStairs(n - 1)
           ways[n - 1] = result
           oneStepWays = result
        }
        var twoStepWays = ways[n - 2]
        if twoStepWays == nil {
            let result = climbStairs(n - 2)
            ways[n - 2] = result
            twoStepWays = result
        }
        return oneStepWays! + twoStepWays!
    }
}
