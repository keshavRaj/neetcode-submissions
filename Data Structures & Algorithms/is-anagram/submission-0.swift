class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var tempLookup = t
        for char in s {
            if let index = tempLookup.firstIndex(of: char) {
                tempLookup.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
}
