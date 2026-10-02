class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        var globalMax = 1
        func calculateLength(_ index: Int) -> Int {
            if index == nums.count - 1 { return 1 }
            if dp[index] != 0 { return dp[index] }
            var localMax = 1
            for i in index..<nums.count {
                if nums[index] < nums[i] {
                    let length = calculateLength(i) + 1
                    if length > localMax {
                        localMax = length
                    }
                }
            }
            dp[index] = localMax
            globalMax = max(localMax, globalMax)
            return localMax
        }
        for i in 0..<nums.count {
            calculateLength(i)
        }
        return globalMax
    }
}
