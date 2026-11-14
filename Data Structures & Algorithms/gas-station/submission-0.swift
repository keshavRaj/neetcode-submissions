class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var starting = 0
        var totalBalance = 0
        var tank = 0
        for i in 0..<gas.count { 
            let diff = gas[i] - cost[i]
            totalBalance += diff
            tank += diff
            if tank < 0 { 
                starting = i + 1
                tank = 0
            }
        }
        return totalBalance < 0 ? -1 : starting
    }
}
