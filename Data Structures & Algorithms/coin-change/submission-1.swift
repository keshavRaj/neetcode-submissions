class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        for target in 1...amount {
            var best: Int = Int.max
            for coin in coins {
                let newTarget = target - coin
                if newTarget >= 0, dp[newTarget] != Int.max {
                    best = min(best, dp[newTarget] + 1)
                }
            }
            dp[target] = best
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
