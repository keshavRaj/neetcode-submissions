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
    var maxDiameter = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
       findMaxDepth(root)
       return maxDiameter
    }

    func findMaxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return -1
        }
        let leftDepth = findMaxDepth(root?.left) + 1
        let rightDepth = findMaxDepth(root?.right) + 1
        let diameter = leftDepth + rightDepth
        if diameter > maxDiameter {
            maxDiameter = diameter
        }
        return max(leftDepth, rightDepth) 
    }
 }
