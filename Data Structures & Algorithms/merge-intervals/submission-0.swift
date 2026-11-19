class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [] }
        let sorted = intervals.sorted{ $0[0] < $1[0] }
        var nextIndex = 1
        var cur = sorted[0]
        var resultIntervals:[[Int]] = []
        while nextIndex < sorted.count { 
            let next = sorted[nextIndex]
            if cur[1] < next[0] { 
                resultIntervals.append(cur)
                cur = next
                nextIndex += 1
            } else {
                cur = [min(cur[0], next[0]), max(cur[1], next[1])]
                nextIndex += 1
            }
        }
        resultIntervals.append(cur)
        return resultIntervals
    }
}
