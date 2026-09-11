class Solution {
    var heap: [Int] = [0]
    func lastStoneWeight(_ stones: [Int]) -> Int {
        for stone in stones {
            push(stone)
        }
        while(heap.count > 2) {
            let firstStone = pop()!
            let secondStone = pop()!
            let res = firstStone - secondStone
            push(res)
        }
        return pop()!
    }

    func push(_ val: Int) {
        heap.append(val)
        var i = heap.count - 1
        while(i > 1 && heap[i / 2] < heap[i])  {
            let temp = heap[i]
            heap[i] = heap[i / 2]
            heap[i / 2] = temp
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
        while(i * 2 < heap.count) {
            if ((i * 2 + 1) < heap.count) &&
            (heap[i * 2 + 1] > heap[i * 2]) &&
            (heap[i * 2 + 1] > heap[i]){
                let temp = heap[i * 2 + 1]
                heap[i * 2 + 1] = heap[i]
                heap[i] = temp
                i = i * 2 + 1 
            } else if (heap[i] < heap[i * 2]) {
                let temp = heap[i * 2]
                heap[i * 2] = heap[i]
                heap[i] = temp
                i = i * 2
            } else {
                break
            }
        }
        return res
    }
    
}
