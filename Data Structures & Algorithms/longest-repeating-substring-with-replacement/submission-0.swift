class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var frequencyMap:[Character: Int] = [:]
        var highestFreq = 1
        let inputArray = Array(s)
        let inputLength = inputArray.count
        var left = 0
        var right = 1
        var longestRun = 1
        var windowSize = 1
        frequencyMap[inputArray[0]] = 1
        while(right < inputLength) {
            let cur = inputArray[right]
            frequencyMap[cur, default:0] += 1
            let curFreq = frequencyMap[cur]!
            if curFreq > highestFreq {
                highestFreq = curFreq
            }
            windowSize += 1
            if (windowSize - highestFreq) <= k {
                right += 1
                longestRun = max(windowSize, longestRun)
            } else {
                while((windowSize - highestFreq) > k) {
                    let start = inputArray[left]
                    frequencyMap[start]! -= 1
                    left += 1
                    var newHighestFreq = 0
                    for value in frequencyMap.values {
                        if value > newHighestFreq {
                            newHighestFreq = value
                        }
                    }
                    highestFreq = newHighestFreq
                    windowSize -= 1
                }
                longestRun = max(windowSize, longestRun)   
                right += 1 
            }
        }
        return max(windowSize, longestRun) 
    }
}
