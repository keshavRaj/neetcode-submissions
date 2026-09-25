class Solution {
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        var longestSubstringLength = 0
        var longestSubstring = ""
        for i in 0..<characters.count {
            var l = i
            var r = i
            while(l >= 0 && r < characters.count && (characters[l] == characters[r])) {
                let length = r - l + 1
                if length > longestSubstringLength {
                   longestSubstringLength = length
                   longestSubstring = String(characters[l...r]) 
                }
                l -= 1
                r += 1
            }

            l = i
            r = i + 1
            while(l >= 0 && r < characters.count && (characters[l] == characters[r])) {
                let length = r - l + 1
                if length > longestSubstringLength {
                   longestSubstringLength = length
                   longestSubstring = String(characters[l...r]) 
                }
                l -= 1
                r += 1
            }
        }
        return longestSubstring
    }
}
