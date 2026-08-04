class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        guard s2Array.count >= s1Array.count else { return false }
        var s1FreqBucket = Array(repeating: 0, count: 26)
        for i in (0..<s1Array.count) {
            let index = Int(s1Array[i].asciiValue! - 97)
            s1FreqBucket[index] += 1
        }
        var left = 0
        var right = s1Array.count - 1
        var windowFreqBucket = Array(repeating: 0, count: 26)
        for i in (0..<s1Array.count) {
             let index = Int(s2Array[i].asciiValue! - 97)
            windowFreqBucket[index] += 1
        }
        while(right < s2Array.count) {
            if windowFreqBucket == s1FreqBucket {
                return true
            }
            let startIndex = Int(s2Array[left].asciiValue! - 97)
            windowFreqBucket[startIndex] -= 1
            left += 1
            right += 1
            if right == s2Array.count { return false }
 
            let endIndex = Int(s2Array[right].asciiValue! - 97)
            windowFreqBucket[endIndex] += 1
        }
        return false
    }
}
