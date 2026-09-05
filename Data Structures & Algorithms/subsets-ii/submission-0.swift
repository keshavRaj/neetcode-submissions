class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var sortedNums = nums.sorted { $0 < $1 }
        var results: [[Int]] = []
        var current: [Int] = []
        func subsetsWithoutDup(_ index: Int) {
            if index >= sortedNums.count {
                results.append(current)
                return
            }
            current.append(sortedNums[index])
            subsetsWithoutDup(index + 1)
            current.removeLast()
            var nextIndex = index + 1
            while(nextIndex < sortedNums.count && sortedNums[nextIndex] == sortedNums[index]) {
                nextIndex += 1
            }
            subsetsWithoutDup(nextIndex)

        }
        subsetsWithoutDup(0)
        return results
    }
}
