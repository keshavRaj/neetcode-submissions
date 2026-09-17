class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let queue = Queue<Coordinate>()
        var visited: Set<Coordinate> = []
        var mutableGrid = grid
        for i in 0..<mutableGrid.count {
            for j in 0..<mutableGrid[i].count {
                if mutableGrid[i][j] == 2 {
                    let coordinate = Coordinate(row: i, col: j)
                    queue.enqueue(coordinate)
                    visited.insert(coordinate)
                }   
            }
        }
        var time = 0
        while(!queue.isEmpty) {
            var isContributing = false
            for _ in 1...queue.count {
                let neighbours = [[1,0], [-1,0], [0,1], [0,-1]]
                let cur = queue.dequeue()!
                for neighbour in neighbours {
                    let newCoordinate = Coordinate(row: cur.row + neighbour[0], col: cur.col + neighbour[1])
                    if min(newCoordinate.row, newCoordinate.col) < 0 ||
                    newCoordinate.row >= mutableGrid.count ||
                    newCoordinate.col >= mutableGrid[newCoordinate.row].count ||
                    visited.contains(newCoordinate) ||
                    mutableGrid[newCoordinate.row][newCoordinate.col] == 0
                     { 
                        continue
                    }
                    visited.insert(newCoordinate)
                    queue.enqueue(newCoordinate)
                    mutableGrid[newCoordinate.row][newCoordinate.col] = 2
                    isContributing = true
                }
            }
            if isContributing {
                time += 1
            }
        }
        var isAllRotten = true
        for i in 0..<mutableGrid.count {
            for j in 0..<mutableGrid[i].count {
                if mutableGrid[i][j] == 1 {
                    isAllRotten = false
                }
            }
        }
        return isAllRotten ? time : -1
    }
}

struct Coordinate: Hashable {
    let row: Int
    let col: Int
}

class Queue<T> {
    private var elements: [T] = []
    private var front = 0
    var isEmpty: Bool {
        return front >= elements.count
    }

    var count: Int {
        return elements.count - front
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

