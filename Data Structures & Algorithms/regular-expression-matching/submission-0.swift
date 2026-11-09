class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let input = Array(s)
        let pattern = Array(p)
        var dp:[[Int]: Bool] = [:]
        func doesMatch(_ i: Int, _ j: Int) -> Bool {
            if j == pattern.count {
                return i == input.count
            }
            if let memo = dp[[i,j]] { return memo }
            let match: Bool
            let isMatching = i < input.count && (pattern[j] == input[i] || pattern[j] == ".")
            if j+1 < pattern.count && pattern[j + 1] == "*" {
                match = (isMatching && doesMatch(i + 1, j)) || doesMatch(i, j + 2)
            } else { 
                match = isMatching && doesMatch(i + 1, j + 1)
            }
            dp[[i,j]] = match
            return match
        }
        return doesMatch(0,0)

    }
}
