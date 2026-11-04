class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let inputArray = Array(s)
        let targetArray = Array(t)
        var dp:[[Int]: Int] = [:]
        func countSubsequence(_ i: Int, _ j: Int) -> Int {
            if j == targetArray.count { return 1 }
            else if i == inputArray.count { return 0 }
            if let memorized = dp[[i,j]] { return memorized }
            let count: Int
            if inputArray[i] == targetArray[j] {
                count = countSubsequence(i + 1, j + 1) + countSubsequence(i + 1, j)
            } else {
                count = countSubsequence(i + 1, j)
            }
            dp[[i,j]] = count
            return count
        } 
        return countSubsequence(0,0)
    }
}
