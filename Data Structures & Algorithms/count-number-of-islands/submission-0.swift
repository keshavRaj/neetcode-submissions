class Solution {
    var visitedSet:Set<[Int]> = []
    var count = 0
    let island = Character("1")
    func numIslands(_ grid: [[Character]]) -> Int {
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == island &&
                !visitedSet.contains([row, col]) {
                    count += 1
                    markVisited(grid, row, col)
                }
            }
        }
        return count
    }

   func markVisited(_ grid: [[Character]], _ row: Int, _ col: Int) {
    if min(row, col) < 0 ||
    row >= grid.count ||
    col >= grid[row].count ||
    grid[row][col] != island ||
    visitedSet.contains([row, col]) {
        return 
    }
    visitedSet.insert([row, col])
    markVisited(grid, row, col + 1)
    markVisited(grid, row, col - 1)
    markVisited(grid, row - 1, col)
    markVisited(grid, row + 1, col)
   }
}
