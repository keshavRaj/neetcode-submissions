class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var width = heights.count - 1
        var maxArea = 0
        var lPointer = 0
        var rPointer = heights.count - 1
        while(lPointer < rPointer) {
            let lValue = heights[lPointer]
            let rValue = heights[rPointer]
            let curArea = min(lValue, rValue) * width
            if curArea > maxArea {
                maxArea = curArea
            }
            if (lValue > rValue) {
                rPointer -= 1
            } else {
                lPointer += 1
            }
            width -= 1
        } 
        return maxArea

    }
}
