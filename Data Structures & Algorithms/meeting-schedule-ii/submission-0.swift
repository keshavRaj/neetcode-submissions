/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        guard !intervals.isEmpty else { return 0 }
        let sorted = intervals.sorted{ $0.start < $1.start }
        let heap = MinHeap()
        for interval in sorted {
            if let min = heap.peek,
             min <= interval.start {
               _ = heap.remove()
            }
            heap.insert(interval.end)
        }
        return heap.count
    }
}

class MinHeap { 
 private var storage:[Int] = [-1]
 var count: Int { return storage.count - 1 }
 var isEmpty: Bool { return storage.count == 1 }
 var peek: Int? { 
    if isEmpty { return nil }
    return storage[1]
 }
 func insert(_ ele: Int) {
    storage.append(ele)
    var i = count
    while(i > 1 && storage[i] < storage[i / 2]) {
        storage.swapAt(i, i/2)
        i = i/2
    }
 }

 func remove() -> Int? {
    if count == 0 { return nil }
    else if count == 1 { return storage.removeLast() }
    let ele = storage[1]
    storage[1] = storage[count]
    _ = storage.removeLast()
    var i = 1
    while 2 * i <= count { 
        let left = 2 * i
        let right = 2 * i + 1
        var smallest = left
        if right <= count && storage[right] < storage[left] {
            smallest = right
        }
        if storage[i] > storage[smallest] {
            storage.swapAt(i, smallest)
            i = smallest
        } else {
            break
        }
    }
    return ele
 }
}
