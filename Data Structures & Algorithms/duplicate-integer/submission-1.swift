class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var seenSet: Set<Int> = []
        for num in nums {
           if seenSet.contains(num) {
            return true
           } else {
            seenSet.insert(num)
           }
        }
        return false
    }
}
