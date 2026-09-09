class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var results: [[String]] = []
        var queensPlacement: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
        var queens: Set<[Int]> = []
        func placeQueen(_ row: Int) {
            var currentResult: [String] = []
            if row == n {
                for i in 0 ..< n {
                    var resultString = ""
                    for j in 0 ..< n {
                        if queens.contains([i,j]) {
                            resultString.append("Q")
                        } else {
                            resultString.append(".")
                        }
                    }
                    currentResult.append(resultString)
                }
                results.append(currentResult)
                return
            }
            for column in 0..<n {
                if !queensPlacement[row][column] {
                    //place queen
                    var currentPlacements: [[Int]] = []
                    queens.insert([row, column])
                    currentPlacements.append([row, column])
                    queensPlacement[row][column] = true
                    //Mark vertical
                    for i in 0..<n {
                        if !queensPlacement[i][column] {
                            queensPlacement[i][column] = true
                            currentPlacements.append([i,column])
                        }
                    } 
                    //Mark horizontal
                    for i in 0..<n {
                        if !queensPlacement[row][i] {
                            queensPlacement[row][i] = true
                            currentPlacements.append([row,i])
                        }
                    }
                    //Mark diagonal negative slope
                    var currentRow = row
                    var currentColumn = column
                    //downwards
                    while(currentRow < n && currentColumn >= 0) {
                        if !queensPlacement[currentRow][currentColumn] {
                            queensPlacement[currentRow][currentColumn] = true
                            currentPlacements.append([currentRow,currentColumn])
                        }
                        currentRow += 1
                        currentColumn -= 1
                    }
                    //upwards
                    currentRow = row
                    currentColumn = column
                    while(currentRow >= 0 && currentColumn < n) {
                        if !queensPlacement[currentRow][currentColumn] {
                            queensPlacement[currentRow][currentColumn] = true
                            currentPlacements.append([currentRow,currentColumn])
                        }
                        currentRow -= 1
                        currentColumn += 1
                    }

                    //Mark diagonal positive slope
                    //downwards
                    currentRow = row
                    currentColumn = column
                    while(currentRow < n && currentColumn < n) {
                        if !queensPlacement[currentRow][currentColumn] {
                            queensPlacement[currentRow][currentColumn] = true
                            currentPlacements.append([currentRow,currentColumn])
                        }
                        currentRow += 1
                        currentColumn += 1
                    }

                    //Upward
                    currentRow = row
                    currentColumn = column
                    while(currentRow >= 0 && currentColumn >= 0) {
                        if !queensPlacement[currentRow][currentColumn] {
                            queensPlacement[currentRow][currentColumn] = true
                            currentPlacements.append([currentRow,currentColumn])
                        }
                        currentRow -= 1
                        currentColumn -= 1
                    }
                    // Recurse to next row
                    placeQueen(row + 1)
                    //Undo these choices
                    queens.remove([row, column])
                    for aPlacement in currentPlacements {
                        queensPlacement[aPlacement[0]][aPlacement[1]] = false
                    }
                }
            }
        }
        placeQueen(0)
        return results
    }
}
