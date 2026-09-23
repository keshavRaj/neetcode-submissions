class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var maxAmount = [nums[0], max(nums[0], nums[1])]
        var i = 2 
        while i < nums.count {
            let temp = maxAmount[1]
            maxAmount[1] = max(maxAmount[1], maxAmount[0] + nums[i])
            maxAmount[0] = temp
            i += 1
        }
        return maxAmount[1]
    }
}
