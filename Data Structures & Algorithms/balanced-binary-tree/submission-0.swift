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
    func isBalanced(_ root: TreeNode?) -> Bool {
        let leftDepthWithBalance = findDepthWithBalance(root?.left)
        let rightDepthWithBalance = findDepthWithBalance(root?.right)
        return leftDepthWithBalance.1 && rightDepthWithBalance.1 && (abs(leftDepthWithBalance.0 - rightDepthWithBalance.0) <= 1)
    }

    func findDepthWithBalance(_ root: TreeNode?) -> (Int, Bool) {
        if root == nil {
            return (0, true)
        }
        let leftDepthWithBalance = findDepthWithBalance(root?.left)
        let rightDepthWithBalance = findDepthWithBalance(root?.right)
        let leftDepth = 1 + leftDepthWithBalance.0
        let rightDepth = 1 + rightDepthWithBalance.0
        let isRootBalanced = leftDepthWithBalance.1 && rightDepthWithBalance.1 && (abs(leftDepthWithBalance.0 - rightDepthWithBalance.0) <= 1)
        return (max(leftDepth, rightDepth), isRootBalanced)

    }
}
