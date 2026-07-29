class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var frequencyVectorDict:[[Int]: [String]] = [:]
        let aAscii = Character("a").asciiValue ?? 97
        for str in strs {
            var freqVector = Array(repeating: 0, count: 26)
            for char in str {
               let position = Int((char.asciiValue ?? 97) - aAscii)
               freqVector[position] += 1
            } 
            frequencyVectorDict[freqVector, default: []].append(str)
        }
        var result: [[String]] = []
        for val in frequencyVectorDict.values {
            result.append(val)
        }
        return result
    }
}
