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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p == nil && q == nil) {
            return true
        } else if (p == nil && q != nil) {
            return false
        } else if (q == nil && p != nil) {
            return false
        } else {
            if p!.val == q!.val {
                let isLeftSubtreeSame = isSameTree(p?.left, q?.left)
                let isRightSubtreeSame = isSameTree(p?.right, q?.right)
                return isLeftSubtreeSame && isRightSubtreeSame
            } else {
                return false
            }
        }
    }
}
