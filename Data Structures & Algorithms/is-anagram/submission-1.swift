class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var freqCount: [Character: Int] = [:]
        for char in s {
            freqCount[char, default:0] += 1
        }
        for char in t {
            if let count = freqCount[char], count > 0 {
                freqCount[char]! -= 1
            } else {
                return false
            }
        }
        return true
    }
}
