class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var numberOfRotation = 0
        if (nums[left] > nums[right]) {
            while(left < right) {
                let mid = (left + right) / 2
                if nums[mid] > nums[right] {
                    left = mid + 1
                } else {
                    right = mid
                }

            }
            numberOfRotation = left
        }
        left = 0
        right = nums.count - 1
        while(left <= right) {
            let mid = (left + right) / 2
            let normalizedMid = (mid + numberOfRotation) % nums.count
            if (nums[normalizedMid] == target) {
                return normalizedMid
            } else if (nums[normalizedMid] > target) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
