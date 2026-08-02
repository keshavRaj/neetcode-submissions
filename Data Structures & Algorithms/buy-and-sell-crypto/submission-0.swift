class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        let daysCount = prices.count
        if daysCount <= 1 {
            return maxProfit
        }
        var buyPointer = 0
        var sellPointer = 1
        while sellPointer < daysCount {
            let buyPrice = prices[buyPointer]
            let sellPrice = prices[sellPointer]
            if sellPrice < buyPrice {
                buyPointer = sellPointer
                sellPointer += 1
            } else {
                let profit = sellPrice - buyPrice
                if profit > maxProfit {
                    maxProfit = profit
                }
                sellPointer += 1
            }
        }
        return maxProfit

    }
}
