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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil {
            return (targetSum - root!.val) == 0
        }
        if hasPathSum(root?.left, targetSum - root!.val) {
            return true
        }
        if hasPathSum(root?.right, targetSum - root!.val) {
            return true
        }
        return false

    }
}
