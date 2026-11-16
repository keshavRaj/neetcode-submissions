class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let input = Array(s)
        var lastIndexDict:[Character: Int] = [:]
        for i in 0..<input.count {
            lastIndexDict[input[i]] = i
        }
        var startPartition = 0
        var endPartition = 0
        var results:[Int] = []
        for i in 0..<input.count {
            let cur = input[i]
            let lastIndex = lastIndexDict[cur]!
            endPartition = max(lastIndex, endPartition)
            if endPartition == i {
                let length = endPartition - startPartition + 1
                results.append(length)
                startPartition = i + 1  
            }
        }
        return results
    }
}
