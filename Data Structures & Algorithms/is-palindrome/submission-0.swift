class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let cleanedString = s.filter { $0.isLetter || $0.isNumber }
        .map{ $0.lowercased() }
        let cleanedStringArray = Array(cleanedString)
        var start = 0
        var end = cleanedStringArray.count - 1
        while(start < end) {
            if cleanedStringArray[start] != cleanedStringArray[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}
