/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    var goodNodes = 0
    func goodNodes(_ root: TreeNode?) -> Int {
        calculateGoodNodes(root, root?.val ?? 0)
        return goodNodes
    }

    func calculateGoodNodes(_ root: TreeNode?, _ maxValueSeen: Int) {
        if root == nil {
            return
        }
        var maxValue = maxValueSeen
        if root!.val >= maxValueSeen {
            goodNodes += 1
            maxValue = root!.val
        }
        calculateGoodNodes(root?.left, maxValue)
        calculateGoodNodes(root?.right, maxValue)

    }
}
