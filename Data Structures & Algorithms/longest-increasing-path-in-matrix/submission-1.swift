class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        var maxLength = 0
        func calculateLongest(_ r: Int, _ c: Int) -> Int {
            if dp[r][c] != 0 { return dp[r][c] }
            let top, bottom, right, left: Int
            let cur = matrix[r][c]
            if r - 1 >= 0 && matrix[r - 1][c] > cur {
                top = calculateLongest(r - 1, c)
            } else {
                top = 0
            }
            if r + 1 < matrix.count && matrix[r + 1][c] > cur {
                bottom = calculateLongest(r + 1, c)
            } else {
                bottom = 0
            }
            if c - 1 >= 0 && matrix[r][c - 1] > cur {
                left = calculateLongest(r, c - 1)
            } else {
                left = 0
            }
            if c + 1 < matrix[0].count && matrix[r][c + 1] > cur {
                right = calculateLongest(r, c + 1)
            } else {
                right = 0
            }
            let maxLength = max(left, right, top, bottom) + 1
            dp[r][c] = maxLength
            return maxLength
        }
        for row in 0..<matrix.count { 
            for col in 0..<matrix[0].count {
                let length = calculateLongest(row, col)
                if length > maxLength { maxLength = length }
            }
        }
        return maxLength
    }
}
