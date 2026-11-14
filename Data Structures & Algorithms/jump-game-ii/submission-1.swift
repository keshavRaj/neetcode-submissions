class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var jump = 1
        var farthest = nums[0]
        var currentEnd = nums[0]
        if farthest >= nums.count - 1 { return 1 }
        for i in 1..<(nums.count - 1) { 
            farthest = max(farthest, i + nums[i])
            if farthest >= nums.count - 1 { 
                return jump + 1
            }
            if i == currentEnd { 
                jump += 1
                currentEnd = farthest
            }
        }
        return jump
    }
}
