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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil {
            return false
        } else if subRoot == nil {
            return true
        } else {
            return isSameTree(root, subRoot) || isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
        }
    }

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        else if p == nil || q == nil {
            return false
        } else {
            if p!.val == q!.val {
                return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
            } else {
                return false
            }
        }
    }
}
