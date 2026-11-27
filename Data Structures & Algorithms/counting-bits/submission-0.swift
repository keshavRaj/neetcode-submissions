class Solution {
    func countBits(_ n: Int) -> [Int] {
        guard n > 0 else  { return [0] }
        var result = Array(repeating: 0, count: n + 1)
        var curOffset = 1
        var curCount = 0
        for i in 1...n {
            result[i] = 1 + result[curCount]
            curCount += 1
            if curCount == curOffset {
                curCount = 0
                curOffset *= 2
            }
         }
        return result
    }
}
