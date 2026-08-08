class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while(left <= right) {
            let mid = (left + right) / 2
            let cur = nums[mid]
            if (cur == target) {
                return mid
            } else if (cur < nums[right]) {
                if ((target > cur) && (target <= nums[right])) {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                if ((target < cur) && target >= nums[left]) {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return -1

    }
}
