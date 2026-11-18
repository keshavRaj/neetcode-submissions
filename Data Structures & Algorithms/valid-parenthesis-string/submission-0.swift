class Solution {
    func checkValidString(_ s: String) -> Bool {
        let input = Array(s)
        var minOpen = 0
        var maxOpen = 0
        for char in input { 
            if char == "(" { 
                minOpen += 1
                maxOpen += 1
            } else if char == ")"{ 
                minOpen = max(0, minOpen - 1)
                maxOpen -= 1
            } else { 
                minOpen = max(0, minOpen - 1)
                maxOpen += 1
            }
            if maxOpen < 0 { return false }
        }
        return minOpen == 0
    }
}
