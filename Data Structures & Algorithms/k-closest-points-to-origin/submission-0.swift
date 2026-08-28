
class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var localCopy = points
        sortPartition(&localCopy, 0, points.count - 1, k)
        var results:[[Int]] = []
        for i in 0..<k {
            results.append(localCopy[i])
        } 
        return results
    }

    private func calculateDistance(_ point: [Int]) -> Int {
        return point[0] * point[0] + point[1] * point[1]
    }

    private func sortPartition(_ points: inout[[Int]], _ s: Int, _ e : Int, _ k: Int) {
        if (e - s + 1) <= 1 {
            return 
        }
        let pivot = points[e]
        let pivotDistance = calculateDistance(points[e])

        var left = s
        for i in s..<e {
            if (pivotDistance > calculateDistance(points[i])) {
                let temp = points[left]
                points[left] = points[i]
                points[i] = temp
                left += 1
            }
        }
        points[e] = points[left]
        points[left] = pivot
        if left == k - 1 {
            return 
        } else if left > (k - 1) {
            sortPartition(&points, s, left - 1, k)
        } else {
            sortPartition(&points, left + 1, e, k)
        }
    }
}
