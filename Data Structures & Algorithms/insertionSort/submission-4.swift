// Definition for a pair
// class Pair {
//     var key: Int
//     var value: String
//     init(_ key: Int, _ value: String) {
//         self.key = key
//         self.value = value
//     }
// }

class Solution {
    func insertionSort(_ pairs: inout [Pair]) -> [[Pair]] {
        if pairs.isEmpty { return [] }
        var states = [pairs]
        for i in 1..<pairs.count {
            var j = i - 1
            while(j >= 0 && pairs[j+1].key < pairs[j].key) {
                let temp = pairs[j+1]
                pairs[j+1] = pairs[j]
                pairs[j] = temp
                j -= 1
            }
            states.append(pairs)
        }
        return states
    }
}
