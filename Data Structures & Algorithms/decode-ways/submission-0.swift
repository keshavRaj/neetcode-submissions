class Solution {
    func numDecodings(_ s: String) -> Int {
        let numbers = Array(s).map { $0.wholeNumberValue! }
        var memorization = Array(repeating: -1, count: numbers.count)
        func countDecodes(_ index: Int) -> Int {
            if index == numbers.count {
                return 1
            } else if numbers[index] == 0 {
                memorization[index] = 0
                return 0
            }
            if memorization[index] != -1 {
                return memorization[index]
            }
            var ways = 0
            ways += countDecodes(index + 1)
            if index + 1 < numbers.count {
                let number = numbers[index] * 10 + numbers[index + 1]
                if number < 27 {
                    ways += countDecodes(index + 2)
                }
            }
            memorization[index] = ways
            return ways
        }
        return countDecodes(0)
    }
}
