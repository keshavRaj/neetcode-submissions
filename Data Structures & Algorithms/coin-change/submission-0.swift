class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp: [Int: Int] = [:]
        func calculateNoOfCoins(_ target: Int) -> Int {
            if target == 0 { return 0 }
            if let memo = dp[target] { return memo }
            var best: Int?
            for coin in coins {
                if target - coin >= 0 {
                    let noOfCoins = dp[target - coin] ?? calculateNoOfCoins(target - coin)
                    if noOfCoins != -1 {
                        best = min(best ?? noOfCoins + 1, noOfCoins + 1)
                    }
                }
            }
            dp[target] = best ?? -1
            return best ?? -1
        }
        return calculateNoOfCoins(amount)
    }
}
