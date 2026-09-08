class Solution {
    func partition(_ s: String) -> [[String]] {
        let characters = Array(s)
        var results: [[String]] = []
        var current: [String] = []
        func backtrack(_ start: Int) {
            if start == characters.count {
                results.append(current)
                return
            }
            for i in start..<characters.count {
                let piece = Array(characters[start...i])
                if isPalindrome(piece) {
                    current.append(String(piece))
                    backtrack(i + 1)
                    current.removeLast()
                }
            }
        }
        backtrack(0)
        return results

    }

    func isPalindrome(_ input: [Character]) -> Bool {
        var start = 0
        var end = input.count - 1
        while(start < end) {
            if input[start] != input[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}
