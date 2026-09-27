class Solution {
    func countSubstrings(_ s: String) -> Int {
        let characters = Array(s)
        var count = 0
        for i in 0..<characters.count {
            var l = i
            var r = i
            while(l >= 0 && r < characters.count && characters[l] == characters[r]) {
                count += 1
                l -= 1
                r += 1
            }
            l = i
            r = i + 1
            while(l >= 0 && r < characters.count && characters[l] == characters[r]) {
                count += 1
                l -= 1
                r += 1
            }
        }
        return count
    }
}
