class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: chars2.count + 1), count: chars1.count + 1)
        for i in 1...chars1.count {
            for j in 1...chars2.count {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[chars1.count][chars2.count]
    }
}
