class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var current: [Int] = []
        func backtrack(_ index: Int) {
            if index == nums.count {
                results.append(current)
                return
            }
            current.append(nums[index])
            backtrack(index + 1)
            current.removeLast()
            backtrack(index + 1)
        }
        backtrack(0)
        return results
    }
}
