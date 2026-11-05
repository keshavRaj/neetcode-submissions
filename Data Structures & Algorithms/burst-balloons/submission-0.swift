class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let padded = [1] + nums + [1]
        var dp:[[Int]: Int] = [:]
        func findMaxCoins(_ l: Int, _ r: Int) -> Int {
            if l > r { return 0 }
            if let memo = dp[[l,r]] { return memo }
            var max = 0
            for k in l...r {
                let val = findMaxCoins(l, k-1) + findMaxCoins(k+1, r) + padded[l-1] * padded[k] * padded[r+1]
                if val > max { max = val }
            }
            dp[[l,r]] = max
            return max
        }
        return findMaxCoins(1, nums.count)
    }
}
