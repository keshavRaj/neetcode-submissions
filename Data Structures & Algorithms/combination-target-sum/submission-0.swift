class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var results:[[Int]] = []
        var current: [Int] = []
        func findCombinations(_ index: Int, _ remaining: Int) {
            if index >= nums.count || remaining < 0 {
                return
            } else if remaining == 0 {
                results.append(current)
                return
            } else {
                current.append(nums[index])
                findCombinations(index, remaining - nums[index])
                current.removeLast()
                findCombinations(index + 1, remaining)

            }
        }
        findCombinations(0, target)
        return results
    }
}
