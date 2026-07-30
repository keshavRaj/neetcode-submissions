class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftPrefixProducts = Array(repeating: 1, count: nums.count)
        var rightPrefixProducts = Array(repeating: 1, count: nums.count)
        for index in (1..<nums.count) {
            let cur = nums[index - 1]
            let prefixMul = cur * leftPrefixProducts[index - 1]
            leftPrefixProducts[index] = prefixMul
        }

        for index in (0..<nums.count-1).reversed() {
            let cur = nums[index + 1]
            let suffixMul = cur * rightPrefixProducts[index + 1]
            rightPrefixProducts[index] = suffixMul
        }

        var results: [Int] = []
        for i in (0..<nums.count) {
            results.append(leftPrefixProducts[i] * rightPrefixProducts[i])
        }
        return results

    }
}
