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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var values: [Int] = []
        inOrderTraverse(root, &values)
        return values
    }

    func inOrderTraverse(_ root: TreeNode?, _ values: inout [Int]) {
        if root == nil {
            return 
        }
        inOrderTraverse(root?.left, &values)
        values.append(root!.val)
        inOrderTraverse(root?.right, &values)
    }
}
