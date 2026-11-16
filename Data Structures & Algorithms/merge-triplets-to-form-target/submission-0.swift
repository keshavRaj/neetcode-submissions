class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var tripletMatched = Array(repeating: false, count: 3)
        for triplet in triplets { 
            var shallConsider = true
            var localMatch = Array(repeating: false, count: 3)
            for i in 0...2 {
                if triplet[i] > target[i] {
                    shallConsider = false
                    break
                } else if triplet[i] == target[i] {
                    localMatch[i] = true
                }
            }
            if shallConsider {
                for i in 0...2 {
                    if localMatch[i] {
                        tripletMatched[i] = true
                    }
                }
            }
        }
        var matched = true
        for match in tripletMatched {
            matched = matched && match
        }
        return matched
    }
}
