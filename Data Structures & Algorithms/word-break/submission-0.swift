class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let characterString = Array(s)
        let wordDictArray = wordDict.map { Array($0) }
        var dp:[Bool?] = Array(repeating: nil, count: characterString.count)
        
        func breakWords(_ i: Int) -> Bool {
            if i == characterString.count { 
                return true
            }
            if let memo = dp[i] {
                return memo
            }
            for wordArray in wordDictArray {
                if matches(wordArray, characterString, at: i) {
                        let canBreak = breakWords(i + wordArray.count)
                        if canBreak { 
                            dp[i] = true
                            return canBreak 
                         }
                }
            }
            dp[i] = false
            return false
        }
       return breakWords(0)

    }

    func matches(_ wordArray: [Character], _ stringArray: [Character], at i: Int) -> Bool {
        if i + wordArray.count <= stringArray.count {
            for index in 0 ..< wordArray.count {
                if wordArray[index] != stringArray[index + i] {
                    return false
                }
            }
            return true
        }
        return false
    }
}
