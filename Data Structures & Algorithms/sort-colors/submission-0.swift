class Solution {
    func sortColors(_ nums: inout [Int]) {
        var buckets = Array(repeating: 0, count: 3)
        for num in nums {
            buckets[num] += 1
        }
        var i = 0
        for j in 0 ..< buckets.count {
            for _ in 0 ..< buckets[j] {
                nums[i] = j
                i += 1
            }
        }
    }
}
