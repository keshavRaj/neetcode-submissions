class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0[1] < $1[1] }
        var eraseCount = 0
        var current = sorted[0]
        for i in 1..<sorted.count { 
            var next = sorted[i]
            if next[0] >= current[1] {
                current = next
            } else {
                eraseCount += 1
            }
        }
        return eraseCount
    }
}
