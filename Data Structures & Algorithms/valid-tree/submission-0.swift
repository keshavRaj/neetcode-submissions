class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if (edges.count != (n - 1)) {
            return false
        } else if n == 1 {
            return true
        }

        var visited:Set<Int> = []
        let queue = Queue()
        let adjacencyList = createAdjacencyList(edges)
        queue.enqueue(0)
        visited.insert(0)
        while(!queue.isEmpty) {
            for _ in 1...queue.count {
                let ele = queue.dequeue()!
                if let neighbors = adjacencyList[ele] {
                    for neighbor in neighbors {
                        if !visited.contains(neighbor) {
                            queue.enqueue(neighbor)
                            visited.insert(neighbor)
                        }
                    }
                }
            }
        }
        for i in 0..<n {
            if !visited.contains(i) {
                return false
            }
        }
        return true

    }

    func createAdjacencyList(_ edges: [[Int]]) -> [Int: [Int]] {
        var adjacencyList:[Int: [Int]] = [:]
        for edge in edges {
            let src = edge[0]
            let dest = edge[1]
            if adjacencyList[src] == nil {
                adjacencyList[src] = []
            } 
            if adjacencyList[dest] == nil {
                adjacencyList[dest] = []
            }
            adjacencyList[src]!.append(dest)
             adjacencyList[dest]!.append(src)
        }
        return adjacencyList
    }
}

class Queue {
    private var elements: [Int] = []
    private var front = 0

    var count: Int {
        return elements.count - front
    }

    var isEmpty: Bool {
        return front >= elements.count
    }

    func enqueue(_ val: Int) {
        elements.append(val)
    }

    func dequeue() -> Int? {
        if isEmpty {
            return nil
        }
        let res = elements[front]
        front += 1
        return res
    }
}
