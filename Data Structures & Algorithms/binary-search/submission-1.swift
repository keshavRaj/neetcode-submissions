class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while(left <= right) {
            let mid = (left + right) / 2
            let cur = nums[mid]
            if cur == target {
                return mid
            } else if cur < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}
