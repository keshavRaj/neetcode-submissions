class KthLargest {
    var heap = [0]
    let k: Int
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            push(num)
        }
        if nums.count > k {
            for _ in 1...(nums.count - k) {
                pop()
            }
        }
    }

    func add(_ val: Int) -> Int {
        push(val)
        if (heap.count - 1) > k {
            pop()
        }
        return heap[1]
    }

    func push(_ val: Int) {
        heap.append(val)
        var i = heap.count - 1
        while(i > 1 && heap[i / 2] > heap[i]) {
            let temp = heap[i]
            heap[i] = heap[i / 2]
            heap[i / 2] = temp
            i = i / 2
        }
    }

    func pop() {
        if heap.count == 1 {
            return
        } else if heap.count == 2 {
            heap.removeLast()
            return
        }
        heap[1] = heap.removeLast()
        var i = 1
        while(2 * i < heap.count) {
            if ((2 * i + 1) < heap.count) &&
               (heap[2 * i + 1] < heap[2 * i]) &&
               (heap[2 * i + 1] < heap[i]) {
                let temp = heap[2 * i + 1]
                heap[2 * i + 1] = heap[i]
                heap[i] = temp
                i = 2 * i + 1
            } else if (heap[2 * i] < heap[i]) {
                let temp = heap[2 * i]
                heap[2 * i] = heap[i]
                heap[i] = temp
                i = i * 2
            } else {
                break
            }
        }
    }
}
