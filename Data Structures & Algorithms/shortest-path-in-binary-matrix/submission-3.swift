class Solution {
    func shortestPathBinaryMatrix(_ grid: inout [[Int]]) -> Int {
        guard grid[0][0] != 1 else { return -1 }
        let queue = Queue<Position>()
        var visited: Set<Position> = []
        var length = 1
        queue.enqueue(Position(row: 0, col: 0))
        visited.insert(Position(row: 0, col: 0))

        while(!queue.isEmpty) {
            for _ in 1...queue.length {
                let cur = queue.dequeue()!
                if cur.row == grid.count - 1 && cur.col == grid.count - 1 { return length } 
                let neighbours = [[0,1], [0,-1], [1,0], [-1, 0], [-1,-1], [1,1], [-1,1], [1,-1]]
                for neighbour in neighbours {
                    let newPosition = Position(row: cur.row + neighbour[0],
                                     col: cur.col + neighbour[1])
                    if min(newPosition.row, newPosition.col) < 0 ||
                    newPosition.row == grid.count ||
                    newPosition.col == grid.count ||
                    visited.contains(newPosition) ||
                    grid[newPosition.row][newPosition.col] == 1 {
                        continue
                    }
                    queue.enqueue(newPosition)
                    visited.insert(newPosition)
                }
            }
            length += 1
        }
        return -1
    }
}

struct Position: Hashable {
    let row: Int
    let col: Int
}

class Queue<T> {
    private var elements: [T] = []
    private var front = 0
    var isEmpty: Bool {
        return front >= elements.count
    }

    var length: Int {
        if isEmpty {
            return 0
        } else {
           return elements.count - front
        }
    }

    func enqueue(_ val: T) {
        elements.append(val)
    }

    func dequeue() -> T? {
        guard !isEmpty else { return nil }
        let element = elements[front]
        front += 1
        return element
    }
}
