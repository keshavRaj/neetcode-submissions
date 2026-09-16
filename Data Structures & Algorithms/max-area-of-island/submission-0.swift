class Solution {
    var visitedIslands: Set<[Int]> = []
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 1 &&
                !visitedIslands.contains([row, col]) {
                    let area = calculateArea(grid, row, col)
                    if area > maxArea {
                        maxArea = area
                    }
                }
            }
        }
        return maxArea
    }

    func calculateArea(_ grid: [[Int]], _ row: Int, _ col: Int) -> Int {
        if min(row, col) < 0 ||
        row >= grid.count ||
        col >= grid[row].count ||
        visitedIslands.contains([row, col]) ||
        grid[row][col] == 0 {
            return 0
        }
        visitedIslands.insert([row, col])
        let left = calculateArea(grid, row - 1, col)
        let right = calculateArea(grid, row + 1, col)
        let top = calculateArea(grid, row, col - 1)
        let bottom = calculateArea(grid, row, col + 1)
        return 1 + left + right + top + bottom
    }
}
