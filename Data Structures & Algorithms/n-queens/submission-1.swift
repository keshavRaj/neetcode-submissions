class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var occupiedColumns: Set<Int> = []
        var occupiedLeftDiagonals: Set<Int> = []
        var occupiedRightDiagonals: Set<Int> = []
        var chessBoard = Array(repeating: Array(repeating: ".", count: n), count: n)
        var results: [[String]] = []
        func placeQueen(_ row: Int) {
            if row == n {
                results.append(chessBoard.map { $0.joined() })
                return
            }
            for i in 0..<n {
               if occupiedColumns.contains(i) ||
                  occupiedLeftDiagonals.contains(row + i) || 
                  occupiedRightDiagonals.contains(row - i) {
                continue
            }
                chessBoard[row][i] = "Q"
                occupiedColumns.insert(i)
                occupiedLeftDiagonals.insert(row + i)
                occupiedRightDiagonals.insert(row - i)
                placeQueen(row + 1)
                chessBoard[row][i] = "."
                occupiedColumns.remove(i)
                occupiedLeftDiagonals.remove(row + i)
                occupiedRightDiagonals.remove(row - i)
            }
        }
        placeQueen(0)
        return results
    }
}
