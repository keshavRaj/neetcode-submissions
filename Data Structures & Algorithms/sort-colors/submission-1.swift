class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0
        var mid = 0
        var high = nums.count - 1
        while(mid <= high) {
            if nums[mid] == 0 {
                let temp = nums[low]
                nums[low] = nums[mid]
                nums[mid] = temp
                low += 1
                mid += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                let temp = nums[high]
                nums[high] = nums[mid]
                nums[mid] = temp
                high -= 1
            }
        }

    }
}
