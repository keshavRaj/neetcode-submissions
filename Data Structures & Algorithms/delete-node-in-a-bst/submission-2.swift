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

    private func findMinNode(_ root: TreeNode?) ->  TreeNode? {
        if root == nil {
            return nil
        }
        var cur = root
        while(cur?.left != nil) {
            cur = cur?.left
        }
        return cur
    }
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if key > root!.val {
            root?.right = deleteNode(root?.right, key)
        } else if key < root!.val {
            root?.left = deleteNode(root?.left, key)
        } else { //found the value
            if root?.left == nil {
                return root?.right
            } else if root?.right == nil {
                return root?.left
            } else {
                let minNode = findMinNode(root?.right)
                root?.val = minNode!.val
                root?.right = deleteNode(root?.right, minNode!.val)
            }
        }
        return root
    }
}
