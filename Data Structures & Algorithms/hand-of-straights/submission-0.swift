class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == 0 else { return false }
        let sortedHands = hand.sorted { $0 < $1 }
        var freqMap:[Int: Int] = [:]
        for hand in sortedHands { 
            freqMap[hand, default: 0] += 1
        }
        var curIndex = 0
        while(curIndex < hand.count) { 
            var cur = sortedHands[curIndex]
            if freqMap[cur, default: 0] != 0 {
                freqMap[cur, default: 0] -= 1
                for _ in 1..<groupSize { 
                    cur += 1
                    if freqMap[cur, default: 0] != 0 { 
                        freqMap[cur, default: 0] -= 1
                    } else { 
                        return false
                    }
                }
            }
            curIndex += 1
        }
        return true
    }
}
