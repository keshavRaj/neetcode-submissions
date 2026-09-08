class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        let digitsDict:[Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t","u", "v"], 
            "9": ["w", "x", "y", "z"]
        ]
        var results: [String] = []
        var current: [Character] = []
        var input: [[Character]] = []
        for digit in Array(digits) {
            input.append(digitsDict[digit]!)
        }

        func recurse(_ index: Int) {
            if index == input.count {
                results.append(String(current))
                return
            }
            let currentChars = input[index]
            for char in currentChars {
                current.append(char)
                recurse(index + 1)
                current.removeLast()
            }
        }
        recurse(0)
        return results
    }
}
