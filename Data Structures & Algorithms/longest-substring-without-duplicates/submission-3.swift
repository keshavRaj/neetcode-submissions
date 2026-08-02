class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let inputLength = s.count
        if (inputLength < 2) {
            return inputLength
        }
        let inputArray = Array(s)
        var longestSubsequence = 0
        var validCharacterSet: Set<Character> = []
        var sequenceStartPointer = 0 
        var sequenceEndPointer = 0
        while sequenceEndPointer < inputLength {
            let current = inputArray[sequenceEndPointer]
            if validCharacterSet.contains(current) {
                longestSubsequence = max(longestSubsequence, validCharacterSet.count)
                while validCharacterSet.contains(current) {
                    let sequenceStartChar = inputArray[sequenceStartPointer]
                    validCharacterSet.remove(sequenceStartChar)
                    sequenceStartPointer += 1
                }
                validCharacterSet.insert(current)
                sequenceEndPointer += 1
            } else {
                validCharacterSet.insert(current)
                sequenceEndPointer += 1
            }
        }
       return max(validCharacterSet.count, longestSubsequence) 
    }
}
