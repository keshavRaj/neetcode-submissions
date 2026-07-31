class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted( by: < )
        var results:[[Int]] = []
        var index = 0
        while(index < sortedNums.count - 2) {
            let cur = sortedNums[index]
            let desiredSum = 0 - cur
            var left = index + 1
            var right = sortedNums.count - 1
            while(left < right) {
                let sum = sortedNums[left] + sortedNums[right]
                if sum < desiredSum {
                    left += 1
                } else if sum > desiredSum {
                    right -= 1
                } else {
                    results.append([cur, sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                    while(left < right) && (sortedNums[left] == sortedNums[left - 1]) {
                        left += 1
                    }
                    while(left < right) && (sortedNums[right] == sortedNums[right + 1]) {
                        right -= 1
                    }
                }
            }
            while((index < sortedNums.count - 2) && (sortedNums[index] == sortedNums[index + 1])) {
                index += 1
            }  
            index += 1
        }
        return results

    }
}
