class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var complimentIndexMap: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            let compliment = target - num
            if let foundIndex = complimentIndexMap[num] {
                return [foundIndex, index]
            }
            complimentIndexMap[compliment] = index
        }
        return [0,1] //It will never be executed as per given constraints. just to satify compiler
    }
}
