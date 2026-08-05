class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let normalizedMatrix = Array(matrix.joined())
        var left = 0
        var right = normalizedMatrix.count - 1
        while(left <= right) {
            let mid = (left + right) / 2
            let cur = normalizedMatrix[mid]
            if (cur == target) {
                return true
            } else if (cur > target) {
                right =  mid - 1
            } else {
                left = mid + 1
            }
        }
        return false

    }
}
