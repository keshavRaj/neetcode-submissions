class MedianFinder {
    let maxHeap = MaxHeap()
    let minHeap = MinHeap()
    private var count = 0
    func addNum(_ num: Int) {
        count += 1
        if maxHeap.count == 0 || maxHeap.peek()! >= num {
            maxHeap.push(num)
            if maxHeap.count > minHeap.count + 1 {
                let val = maxHeap.pop()!
                minHeap.push(val)
            }
        } else {
            minHeap.push(num)
            if maxHeap.count < minHeap.count {
                let val = minHeap.pop()!
                maxHeap.push(val)
            }
        }
    }

    func findMedian() -> Double {
        if count % 2 == 0 {
            return (Double(maxHeap.peek()!) + Double(minHeap.peek()!)) / 2.0
        } else {
            return Double(maxHeap.peek()!)
        }
    }
}

class MaxHeap {
    private var elements: [Int] = [0]
    var count: Int {
        return elements.count - 1
    }

    func push(_ val: Int) {
        elements.append(val)
        var i = elements.count - 1
        while(i > 1 && elements[i] > elements[i / 2]) {
            elements.swapAt(i, i / 2)
            i = i / 2
        }
    }

    func pop() -> Int? {
        if count == 0 {
            return nil
        } else if count == 1 {
            return elements.removeLast()
        }
        let res = elements[1]
        elements[1] = elements.removeLast()
        var i = 1
        while(2 * i) < elements.count {
            if (2 * i + 1) < elements.count &&
            elements[2 * i + 1] > elements[2 * i] &&
            elements[i] < elements[2 * i + 1] {
                elements.swapAt(i, 2 * i + 1)
                i = 2 * i + 1
            } else if elements[i] < elements[2 * i] {
                elements.swapAt(i, 2 * i)
                i = 2 * i
            } else {
                break
            }
        }
        return res
    }

    func peek() -> Int? {
        if count == 0 {
            return nil
        }
        return elements[1]
    }
}

class MinHeap {
    private var elements: [Int] = [0]
    var count: Int {
        return elements.count - 1
    }

    func push(_ val: Int) {
        elements.append(val)
        var i = elements.count - 1
        while(i > 1 && elements[i] < elements[i / 2]) {
            elements.swapAt(i, i / 2)
            i = i / 2
        }
    }

    func pop() -> Int? {
        if count == 0 {
            return nil
        } else if count == 1 {
            return elements.removeLast()
        }
        let res = elements[1]
        elements[1] = elements.removeLast()
        var i = 1
        while(2 * i) < elements.count {
            if (2 * i + 1) < elements.count &&
            elements[2 * i + 1] < elements[2 * i] &&
            elements[2 * i + 1] < elements[i] {
                elements.swapAt(2 * i + 1, i)
                i = 2 * i + 1
            } else if elements[2 * i] < elements[i] {
                elements.swapAt(i , 2 * i)
                i = 2 * i
            } else {
                break
            }
        }
        return res
    }

    func peek() -> Int? {
        if count == 0 {
            return nil
        } else {
            return elements[1]
        }
    }
}
