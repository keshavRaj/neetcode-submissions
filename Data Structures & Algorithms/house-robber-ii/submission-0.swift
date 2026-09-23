class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var maxProfitWithFirstHouse = [nums[0], max(nums[0], nums[1])]
        var i = 2
        while i < nums.count - 1 {
            let temp = maxProfitWithFirstHouse[1]
            maxProfitWithFirstHouse[1] = max(maxProfitWithFirstHouse[1], maxProfitWithFirstHouse[0] + nums[i])
            maxProfitWithFirstHouse[0] = temp
            i += 1
        }

        var maxProfitWithOutFirstHouse = [nums[1], max(nums[1], nums[2])]
        i = 3 
        while i < nums.count {
            let temp = maxProfitWithOutFirstHouse[1]
            maxProfitWithOutFirstHouse[1] = max(maxProfitWithOutFirstHouse[1], maxProfitWithOutFirstHouse[0] + nums[i])
            maxProfitWithOutFirstHouse[0] = temp
            i += 1
        }
        return max(maxProfitWithOutFirstHouse[1], maxProfitWithFirstHouse[1])
    }
}
