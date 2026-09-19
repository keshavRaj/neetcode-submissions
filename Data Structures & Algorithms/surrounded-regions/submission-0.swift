class Solution {
    func solve(_ board: inout [[Character]]) {
        let o = Character("O")
        let x = Character("X")
        var safe: Set<Position> = []
        let queue = Queue<Position>()
        let rowCount = board.count
        let colCount = board[0].count
        for row in 0..<rowCount {
            if board[row][0] == o {
                let position = Position(row: row, col: 0)
                safe.insert(position)
                queue.enqueue(position)
            }
            if board[row][colCount - 1] == o {
                let position = Position(row: row, col: colCount - 1)
                safe.insert(position)
                queue.enqueue(position)
            }
        }

        for col in 0..<colCount {
            if board[0][col] == o {
                let position = Position(row: 0, col: col)
                safe.insert(position)
                queue.enqueue(position)
            }
            if board[rowCount - 1][col] == o {
                let position = Position(row: rowCount - 1, col: col)
                safe.insert(position)
                queue.enqueue(position)
            }
        }
        while(!queue.isEmpty) {
            for _ in 1...queue.count {
                let cur = queue.dequeue()!
                let neighbors = [[1,0], [-1,0], [0,1], [0,-1]]
                for neighbor in neighbors {
                    let newPos = Position(row: cur.row + neighbor[0], col: cur.col + neighbor[1])
                    if min(newPos.row, newPos.col) < 0 ||
                    newPos.row >= rowCount ||
                    newPos.col >= colCount ||
                    safe.contains(newPos) ||
                    board[newPos.row][newPos.col] != o {
                        continue
                    }
                    safe.insert(newPos)
                    queue.enqueue(newPos)
                }
            }
        }
        for row in 0..<rowCount {
        for col in 0..<colCount {
            if board[row][col] == o {
                let position = Position(row: row, col: col)
                if !safe.contains(position) {
                    board[row][col] = x
                }
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
        guard !isEmpty else { return nil }
        let ele = elements[front]
        front += 1
        return ele
    }
}
