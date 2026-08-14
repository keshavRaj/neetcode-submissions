class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]
        while(slow != fast) {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        var meetingPoint = 0
        while(meetingPoint != fast) {
            meetingPoint = nums[meetingPoint]
            fast = nums[fast]
        }
        return meetingPoint
    }
}
