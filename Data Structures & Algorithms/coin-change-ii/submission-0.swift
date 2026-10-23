class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp: [[Int]:Int] = [:]
        func countCombinations(_ index: Int, _ remaining: Int) -> Int {
            if remaining == 0 { return 1 }
            else if remaining < 0 || index >= coins.count { return 0 }
            if let count = dp[[index, remaining]] { return count }
            let count = countCombinations(index, remaining - coins[index]) + countCombinations(index + 1, remaining)
            dp[[index, remaining]] = count
            return count
        }
        return countCombinations(0, amount)
    }
}
