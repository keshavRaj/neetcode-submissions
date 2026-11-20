/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 1 else { return true }
        let sorted = intervals.sorted { $0.start < $1.start }
        for i in 1..<sorted.count {
            let prev = sorted[i - 1]
            let cur = sorted[i]
            if prev.end > cur.start { 
                return false
            }
        }
        return true
    }
}
