class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var leftPointer = 0
        var rightPointer = numbers.count - 1
        while(leftPointer < rightPointer) {
            let curSum = numbers[leftPointer] + numbers[rightPointer]
            if curSum > target {
                rightPointer -= 1
            } else if curSum < target {
                leftPointer += 1
            } else {
                return [leftPointer + 1, rightPointer + 1]
            }
        }
        return [] //As per constarint this case wont come. Satisfying compiler
    }
}
