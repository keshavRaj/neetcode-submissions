class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % 2 == 1 {
            return false
        }
        let target = sum / 2
        var dp:[[Int]: Bool] = [:]

        func isTargetAchievable(_ index: Int, _ remaining: Int) -> Bool {
            if remaining == 0 {
                return true
            } else if remaining < 0 || index >= nums.count {
                return false
            }
            if let value = dp[[index, remaining]] {
                return value
            }
            let isAchievableIncluding = isTargetAchievable(index + 1, remaining - nums[index])
            if isAchievableIncluding {
                dp[[index, remaining]] = true
                return true
            }
            let isAchievableExcluding = isTargetAchievable(index + 1, remaining)
            if isAchievableExcluding {
                dp[[index, remaining]] = true
                return true
            }
            dp[[index, remaining]] = false
            return false
        }
        return isTargetAchievable(0, target)
    }
}
