class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let inputArray = Array(word1)
        let targetArray = Array(word2)
        var dp:[[Int]: Int] = [:]
        func calculateMin(_ i: Int, _ j: Int) -> Int {
            if i == inputArray.count && j == targetArray.count { return 0 }
            else if i == inputArray.count { return targetArray.count - j }
            else if j == targetArray.count { return inputArray.count - i }
            else if let memo = dp[[i,j]] { return memo }
            let minDist: Int
            if inputArray[i] == targetArray[j] {
                 minDist = calculateMin(i+1, j+1) 
                }
            else {
                let insert = 1 + calculateMin(i, j + 1)
                let delete = 1 + calculateMin(i + 1, j)
                let replace = 1 + calculateMin(i + 1, j + 1)
                minDist = min(insert, delete, replace)
            }
            dp[[i,j]] = minDist
            return minDist
        }
        return calculateMin(0,0)
    }
}
