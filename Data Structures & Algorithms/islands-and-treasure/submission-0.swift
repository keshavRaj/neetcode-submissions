class Solution {
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        let land = Int(Int32.max)
        let queue = Queue<Position>()
        var visited: Set<Position> = [] 
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 {
                    let position = Position(row: i, col: j)
                    visited.insert(position)
                    queue.enqueue(position)
                }
            }
        }
        while(!queue.isEmpty) {
            for _ in 1...queue.count {
                let cur = queue.dequeue()!
                let neighbours = [[1,0], [-1,0], [0,1], [0,-1]]
                for neighbour in neighbours {
                let newPosition = Position(row: cur.row + neighbour[0], col: cur.col + neighbour[1])
                if min(newPosition.row, newPosition.col) < 0 ||
                newPosition.row >= grid.count ||
                newPosition.col >= grid[newPosition.row].count ||
                visited.contains(newPosition) ||
                grid[newPosition.row][newPosition.col] == -1 {
                    continue
                }
                visited.insert(newPosition)
                queue.enqueue(newPosition)
                grid[newPosition.row][newPosition.col] = grid[cur.row][cur.col] + 1
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
        let val = elements[front]
        front += 1
        return val
    }
}
