class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        cur_index = 0
        garbage_index = len(nums) - 1
        while cur_index <= garbage_index:
            if (nums[cur_index] == val):
                while(nums[garbage_index] == val):
                    garbage_index -= 1
                    if garbage_index < 0:
                        return 0
                    elif garbage_index <= cur_index:
                        return 0  if cur_index == 0  else  cur_index 
                nums[cur_index] = nums[garbage_index]
                garbage_index -= 1
            cur_index += 1
            print(nums)
        return garbage_index + 1





        