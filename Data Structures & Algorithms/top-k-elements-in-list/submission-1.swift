class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqDict:[Int : Int] = [ : ]
        for num in nums {
            freqDict[num, default: 0] += 1
        }
        var frequencyBucket:[[Int]] = Array(repeating: [], count: nums.count + 1) 
        for (_, element) in freqDict.enumerated() {
            frequencyBucket[element.value].append(element.key)
        }
        var results: [Int] = []
        for items in frequencyBucket.reversed() {
            results.append(contentsOf: items)
            if (results.count >= k) {
                return results
            }
        } 
        return results
    }
}
