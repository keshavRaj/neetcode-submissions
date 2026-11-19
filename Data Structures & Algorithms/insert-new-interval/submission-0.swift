class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var resultIntervals:[[Int]] = []
        var current = newInterval
        for i in 0..<intervals.count { 
            let next = intervals[i]
            if current[1] < next[0] { 
                resultIntervals.append(current)
                resultIntervals += Array(intervals[i..<intervals.count])
                return resultIntervals
            } else if current[0] > next[1] { 
                resultIntervals.append(next)
            } else {
                current = [min(current[0], next[0]), max(current[1], next[1])]
            }
        }
        resultIntervals.append(current)
        return resultIntervals
    }
}
