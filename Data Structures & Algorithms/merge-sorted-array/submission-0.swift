class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var l = Array(repeating: 0, count: m)
        var r = Array(repeating: 0, count: n)
        for i in 0..<m {
            l[i] = nums1[i]
        }
        for i in 0..<n {
            r[i] = nums2[i]
        }
        var i = 0
        var j = 0
        var k = 0
        while(i < m && j < n) {
            if l[i] <= r[j] {
                nums1[k] = l[i]
                i += 1
            } else {
                nums1[k] = r[j]
                j += 1
            }
            k += 1
        }
        while(i < m) {
            nums1[k] = l[i]
            k += 1
            i += 1
        }

        while(j < n) {
            nums1[k] = r[j]
            k += 1
            j += 1
        }
    }
}
