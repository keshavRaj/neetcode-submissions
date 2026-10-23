class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var dp: [[Int]: Int] = [:]
        func countWays(_ index: Int, _ remaining: Int) -> Int {
            if index == nums.count { 
                return remaining == 0 ? 1 : 0
            }
            if let ways = dp[[index, remaining]] { return ways }
            let ways = countWays(index + 1, remaining - nums[index]) + countWays(index + 1, remaining + nums[index])
            dp[[index, remaining]] = ways
            return ways
        }
        return countWays(0, target)
    }
}
