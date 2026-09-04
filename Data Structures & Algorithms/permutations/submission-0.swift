class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var localNums = nums
        var results: [[Int]] = []
        func recursePermutation(_ index: Int) {
            if index == nums.count {
                results.append(localNums)
                return
            }
            for i in index..<nums.count {
                localNums.swapAt(i, index)
                recursePermutation(index + 1)
                localNums.swapAt(index, i)
            }
        }
        recursePermutation(0)
        return results
    }
}
