class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:
        length = len(arr) - 1
        for i in range(len(arr)):
            if i != length:
                arr[i] = arr[i + 1]
                j = i
                while(j > 0 and arr[j -1] < arr[i]):
                    arr[j-1] = arr[i]
                    j -= 1
            else:
                arr[i] = -1
        return arr