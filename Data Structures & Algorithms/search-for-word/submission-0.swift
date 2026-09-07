class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let columns = board[0].count
        let words = Array(word)
        var visited: Set<[Int]> = []

        func searchWord(_ x: Int, _ y: Int, _ searchIndex: Int) -> Bool {
            if board[x][y] == words[searchIndex] {
                if searchIndex == words.count - 1 {
                    return true
                } else {
                    visited.insert([x,y])
                    var bottomSearchResult = false
                    if x + 1 < rows && !visited.contains([x + 1, y]) {
                        bottomSearchResult = searchWord(x + 1, y, searchIndex + 1)
                    }
                    if bottomSearchResult {
                        visited.remove([x,y])
                        return true
                    }

                    var topSearchResult = false
                    if x - 1 >= 0 && !visited.contains([x - 1, y]) {
                        topSearchResult = searchWord(x - 1, y, searchIndex + 1)
                    }
                    if topSearchResult {
                        visited.remove([x,y])
                        return true
                    }
                    var leftSearchResult = false
                    if y - 1 >= 0 && !visited.contains([x, y - 1]) {
                        leftSearchResult = searchWord(x, y - 1, searchIndex + 1)
                    }
                    if leftSearchResult {
                        visited.remove([x,y])
                        return true
                    }
                    var rightSearchResult = false
                    if y + 1 < columns && !visited.contains([x, y + 1]) {
                        rightSearchResult = searchWord(x, y + 1, searchIndex + 1)
                    }
                    if rightSearchResult {
                        visited.remove([x,y])
                        return true
                    }
                    visited.remove([x, y])
                    return false
                }
            } else {
                return false
            }
        }
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if searchWord(i,j,0) {
                    return true
                }
            }
        }
        return false
    }
}
