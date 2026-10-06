class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        func countPaths(_ row: Int, _ col: Int) -> Int {
            if row == m || col == n {
                return 0
            } else if row == m - 1 && col == n - 1 {
                dp[row][col] = 1
                return 1
            } else if dp[row][col] != 0 { 
                return dp[row][col]
            }
            dp[row][col] = countPaths(row + 1, col) + countPaths(row, col + 1)
            return dp[row][col]
        }
        countPaths(0,0)
        return dp[0][0]

    }
}
