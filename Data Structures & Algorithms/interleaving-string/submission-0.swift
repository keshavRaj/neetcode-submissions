class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        let s3Array = Array(s3)
        if s3Array.count != s1Array.count + s2Array.count { return false }
        var dp:[[Int]: Bool] = [:]
        func canInterleaveAt(_ i: Int, _ j: Int) -> Bool {
            if i == s1Array.count && j == s2Array.count { return true }
            let key = [i,j]
            if let result = dp[key] { return result }
            if i < s1Array.count && s1Array[i] == s3Array[i + j] {
                let result = canInterleaveAt(i + 1, j)
                if result { return true }
            }
            if j < s2Array.count && s2Array[j] == s3Array[i + j] {
                let result = canInterleaveAt(i, j + 1)
                if result { return true }
            }
            dp[key] = false
            return false
        }
        return canInterleaveAt(0,0)
    }
}
