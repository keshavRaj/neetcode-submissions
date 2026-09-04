class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var nums = candidates
        quickSort(&nums, 0, nums.count - 1)
        var results: [[Int]] = []
        var current: [Int] = []
        func recursiveCombination(_ index: Int,_ remaining: Int) {
            if remaining == 0 {
                results.append(current)
                return
            } else if remaining < 0 || index >= nums.count {
                return
            } else {
                current.append(nums[index])
                recursiveCombination(index + 1, remaining - nums[index])
                current.removeLast()
                var nextIndex = index + 1
                while(nextIndex < nums.count && nums[index] == nums[nextIndex]) {
                    nextIndex += 1
                }
                recursiveCombination(nextIndex, remaining)
            }
        }
        recursiveCombination(0, target)
        return results
    }

    func quickSort(_ nums: inout [Int],_ s: Int, _ e: Int) {
        if e <= s { return }
        let pivot = nums[e]
        var left = s
        for i in s..<e {
            if nums[i] < pivot {
                let temp = nums[left]
                nums[left] = nums[i]
                nums[i] = temp
                left += 1
            }
        }
        nums[e] = nums[left]
        nums[left] = pivot
        quickSort(&nums, s, left - 1)
        quickSort(&nums, left + 1, e)
    }
}
