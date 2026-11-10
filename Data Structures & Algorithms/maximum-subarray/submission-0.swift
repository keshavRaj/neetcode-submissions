class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var curSum = nums[0]
        for i in 1..<nums.count {
            curSum = max(nums[i], curSum+nums[i])
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}
