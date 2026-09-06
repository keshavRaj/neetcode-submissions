class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var current: [String] = []
        var results: [String] = []
        var openingCount = 0
        var closingCount = 0
        func generateAll() {
            if openingCount == n && closingCount == n {
                results.append(current.joined())
                return
            }
            if openingCount < n {
                current.append("(")
                openingCount += 1
                generateAll()
                current.removeLast()
                openingCount -= 1
            }
            if closingCount < openingCount {
                current.append(")")
                closingCount += 1
                generateAll()
                current.removeLast()
                closingCount -= 1
            }
        }
        generateAll()
        return results
    }
}
