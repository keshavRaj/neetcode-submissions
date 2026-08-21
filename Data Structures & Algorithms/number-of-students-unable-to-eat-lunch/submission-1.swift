class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var demands = Array(repeating: 0, count: 2)
        for aStudent in students {
            demands[aStudent] += 1
        }
        for aSandwich in sandwiches {
            if demands[aSandwich] == 0 {
                break
            }
            demands[aSandwich] -= 1
        }
        return demands.reduce(0, +)
    }
}