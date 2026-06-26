class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        max_run = 0
        cur_run = 0
        for num in nums:
            if (num == 0):
                if (cur_run > max_run):
                    max_run = cur_run
                    cur_run = 0
                else:
                    cur_run = 0
            else:
                cur_run += 1
        return max_run if max_run > cur_run else cur_run