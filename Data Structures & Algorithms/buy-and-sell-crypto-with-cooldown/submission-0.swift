class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        struct Key: Hashable {
            let day: Int
            let holding: Bool
        }
        var dp: [Key: Int] = [:]
        func calculateMaxProfit(_ day: Int, _ holding: Bool) -> Int {
            if day >= prices.count { return 0 }
            let key = Key(day: day, holding: holding)
            if let profit = dp[key] { return profit }
            if holding {
                let profit = max(calculateMaxProfit(day + 1, true), prices[day] + calculateMaxProfit(day + 2, false))
                dp[key] = profit
                return profit
            } else {
                let profit = max(calculateMaxProfit(day + 1, false), -prices[day] + calculateMaxProfit(day + 1, true))
                dp[key] = profit
                return profit
            }
        }
        return calculateMaxProfit(0,false)
    }
}
