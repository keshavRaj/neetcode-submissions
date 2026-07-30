class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowWiseValueSet: [Set<Int>] = Array(repeating: Set<Int>(), count: 9)
        var columnWiseValueSet: [Set<Int>] = Array(repeating: Set<Int>(), count: 9)
        var boxWiseValueSet: [Set<Int>] = Array(repeating: Set<Int>(), count: 9)

        for row in (0..<9) {
            for col in (0..<9) {
                let entry = board[row][col]
                if  entry != "." {
                    let number = Int(String(entry))!
                    let boxIndex = (row / 3) * 3 + (col / 3)
                    if !rowWiseValueSet[row].contains(number),
                    !columnWiseValueSet[col].contains(number),
                    !boxWiseValueSet[boxIndex].contains(number) {
                        rowWiseValueSet[row].insert(number)
                        columnWiseValueSet[col].insert(number)
                        boxWiseValueSet[boxIndex].insert(number)
                    } else {
                        return false
                    }
                }
            }
        }
        return true
    }
}
