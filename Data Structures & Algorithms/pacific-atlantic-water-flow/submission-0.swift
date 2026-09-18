class Solution {
    var pacificReachable: Set<Position> = []
    var atlanticReachable: Set<Position> = []
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        fillPacificReachablity(heights)
        fillAtlanticReachablity(heights)
        var results: [[Int]] = []
        for row in 0..<heights.count {
            for col in 0..<heights[row].count {
                let position = Position(row: row, col: col)
                if pacificReachable.contains(position) &&
                atlanticReachable.contains(position) {
                    results.append([row, col])
                }
            }
        }
        return results
    }

    func fillPacificReachablity(_ heights: [[Int]]) {
        let queue = Queue<Position>()
        var visited: Set<Position> = []
        for col in 0..<heights[0].count {
            let position = Position(row: 0, col: col)
            queue.enqueue(position)
            visited.insert(position)
            pacificReachable.insert(position)
        }
        for row in 0..<heights.count {
            let position = Position(row: row, col: 0)
            queue.enqueue(position)
            visited.insert(position)
            pacificReachable.insert(position)
        }

        while !queue.isEmpty {
            for _ in 1...queue.count {
                let cur = queue.dequeue()!
                let neighbours = [[1,0], [-1,0], [0,1], [0,-1]]
                for neighbour in neighbours {
                    let newPos = Position(row: cur.row + neighbour[0], col: cur.col + neighbour[1])
                    if min(newPos.row, newPos.col) < 0 ||
                    newPos.row >= heights.count ||
                    newPos.col >= heights[newPos.row].count ||
                    visited.contains(newPos) || 
                    heights[newPos.row][newPos.col] < heights[cur.row][cur.col] {
                        continue
                    }
                    queue.enqueue(newPos)
                    visited.insert(newPos)
                    pacificReachable.insert(newPos) 
                }
            }
        }

    }

    func fillAtlanticReachablity(_ heights: [[Int]]) {
        let queue = Queue<Position>()
        var visited: Set<Position> = []
        for col in 0..<heights[heights.count - 1].count {
            let position = Position(row: heights.count - 1, col: col)
            queue.enqueue(position)
            visited.insert(position)
            atlanticReachable.insert(position)
        }
        for row in 0..<heights.count {
            let position = Position(row: row, col: heights[row].count - 1)
            queue.enqueue(position)
            visited.insert(position)
            atlanticReachable.insert(position)
        }

        while !queue.isEmpty {
            for _ in 1...queue.count {
                let cur = queue.dequeue()!
                let neighbours = [[1,0], [-1,0], [0,1], [0,-1]]
                for neighbour in neighbours {
                    let newPos = Position(row: cur.row + neighbour[0], col: cur.col + neighbour[1])
                    if min(newPos.row, newPos.col) < 0 ||
                    newPos.row >= heights.count ||
                    newPos.col >= heights[newPos.row].count ||
                    visited.contains(newPos) || 
                    heights[newPos.row][newPos.col] < heights[cur.row][cur.col] {
                        continue
                    }
                    queue.enqueue(newPos)
                    visited.insert(newPos)
                    atlanticReachable.insert(newPos) 
                }
            }
        }
    }
}

struct Position: Hashable {
    let row: Int
    let col: Int
}

class Queue<T> {
    private var elements: [T] = []
    private var front = 0
    var count: Int {
        return elements.count - front
    }

    var isEmpty: Bool {
        return front >= elements.count
    }

    func enqueue(_ val: T) {
        elements.append(val)
    }

    func dequeue() -> T? {
        if isEmpty { return nil }
        let element = elements[front]
        front += 1
        return element
    }
}
