class Solution {
    struct HeapEntry {
        let size: Int
        let end: Int
    }

    struct QueryEntry {
        let query: Int
        let index: Int
    }

    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var queryEntries: [QueryEntry] = []
        for i in 0..<queries.count {
            let query = QueryEntry(query: queries[i], index: i)
            queryEntries.append(query)
        }
        queryEntries.sort{ $0.query < $1.query }
        var result: [Int] = Array(repeating: -1, count: queries.count)
        let heap = MinHeap()
        var cur = 0
        for queryEntry in queryEntries {
            while cur < sortedIntervals.count && sortedIntervals[cur][0] <= queryEntry.query {
                let heapEntry = HeapEntry(size: sortedIntervals[cur][1] - sortedIntervals[cur][0] + 1, end: sortedIntervals[cur][1])
                heap.insert(heapEntry)
                cur += 1
            } 
            while let val = heap.peek , val.end < queryEntry.query {
                _ = heap.remove()
            }
            if let val = heap.peek {
                result[queryEntry.index] = val.size
            }
        }
        return result

    }

    class MinHeap { 
      private var storage: [HeapEntry] = [HeapEntry(size: -1, end: -1)]
      var count: Int { return storage.count - 1 }
      var isEmpty: Bool { return storage.count == 1 }
      var peek: HeapEntry? { if isEmpty { return nil } else { return storage[1] } }

      func insert(_ ele: HeapEntry) {
        storage.append(ele)
        var i = count
        while(i > 1 && storage[i].size < storage[i/2].size) {
            storage.swapAt(i, i/2)
            i = i/2
        }
      }

      func remove() -> HeapEntry? {
        if isEmpty { return nil }
        else if count == 1 { return storage.popLast() }
        let ele = storage[1]
        storage[1] = storage[count]
        _ = storage.popLast()
        var i = 1
        while i * 2 <= count {
            var left = i * 2
            var right = i * 2 + 1
            var smallest = left
            if right <= count && storage[left].size > storage[right].size {
                smallest = right
            } 
            if storage[i].size > storage[smallest].size {
                storage.swapAt(i, smallest)
                i = smallest
            } else {
                break
            }
        }
        return ele
      }
    }
}
