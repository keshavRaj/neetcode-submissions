class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var freqMap:[Int : Int] = [ : ]
        for num in nums {
            if let freq = freqMap[num] {
                freqMap[num] = freq + 1
            } else {
                freqMap[num] = 1
            }
        }
        for freq in freqMap.values {
            if freq > 1 {
                return true
            }
        }
        return false
    }
}
