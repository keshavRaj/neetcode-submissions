class Solution {
    var heap: [Int] = [0]
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        for num in nums {
            push(num)
            if heap.count > k + 1 {
                _ = pop()
            }
        }
        return pop()!
    }

    func push(_ val: Int) {
        heap.append(val)
        var i = heap.count - 1
        while(i > 1 && heap[i / 2] > heap[i]) {
            heap.swapAt(i, i / 2)
            i = i / 2
        }
    }

    func pop() -> Int? {
        if heap.count == 1 {
            return nil
        } else if heap.count == 2 {
            return heap.removeLast()
        }
        let res = heap[1]
        heap[1] = heap.removeLast() 
        var i = 1
        while(2 * i < heap.count) {
            if ((2 * i + 1) < heap.count) &&
            (heap[2 * i + 1] < heap[2 * i]) &&
            (heap[i] > heap[2 * i + 1]) {
                heap.swapAt(i , 2 * i + 1)
                i = 2 * i + 1
            } else if (heap[i] > heap[2 * i]) {
                heap.swapAt(i, 2 * i)
                i = 2 * i
            } else {
                break
            }
        }
        return res
    }
}
