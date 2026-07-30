class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var curRun = 0
        var longestRun = 0
        for num in nums {
            if numSet.contains(num - 1) {
                continue
            } else {
                var temp = num
                curRun = 1
                while(numSet.contains(temp + 1)) {
                    curRun += 1
                    temp += 1
                }
                if curRun > longestRun {
                    longestRun = curRun
                }
            }
        }
        return longestRun
    }
}
