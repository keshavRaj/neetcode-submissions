class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 1 { 
            return nums[0]
        }
        var currentMax = nums[0]
        var currentMin = nums[0]
        var result = nums[0]
        var i = 1
        while i < nums.count {
            let cur = nums[i]
            let localMax = max(currentMax * cur , currentMin * cur, cur)
            let localMin = min(currentMax * cur , currentMin * cur, cur)
            currentMax = localMax
            currentMin = localMin
            if currentMax > result {
                result = currentMax
            }
            i += 1
        }
        return result
    }
}
