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
    private var preorderIndex = 0
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return build(0, preorder.count-1, inorder, preorder)
    }

    func build(_ left: Int, _ right: Int, _ inorder: [Int], _ preorder: [Int]) -> TreeNode? {
        if left > right {
            return nil
        }
        let currentRootValue = preorder[preorderIndex]
        preorderIndex += 1
        var rootIndex = left
        while(inorder[rootIndex] != currentRootValue) {
            rootIndex += 1
        }
        let root = TreeNode(currentRootValue)
        root.left = build(left, rootIndex - 1, inorder, preorder)
        root.right = build(rootIndex + 1, right, inorder, preorder)
        return root
    }
}
