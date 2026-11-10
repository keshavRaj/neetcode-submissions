class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = nums[0]
        for i in 1..<nums.count { 
            if i > maxReach { 
                return false
            }
            maxReach = max(maxReach, i + nums[i])
        }
        return true
    }
}
