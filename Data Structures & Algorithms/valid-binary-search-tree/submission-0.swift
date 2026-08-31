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
    func isValidBST(_ root: TreeNode?) -> Bool {
       return isValid(root, nil, nil)
    }

    func isValid(_ root: TreeNode? , _ lowerBound: Int?, _ upperBound: Int?) -> Bool {
         if root == nil {
            return true
        }
        var isGreaterThanLowerBound = true
        if let lower = lowerBound {
            isGreaterThanLowerBound = root!.val > lower
        }
        var isSmallerThanUpperBound = true
        if let upper = upperBound {
            isSmallerThanUpperBound = root!.val < upper
        }

        return isGreaterThanLowerBound && isSmallerThanUpperBound && isValid(root?.left, lowerBound, root!.val) && isValid(root?.right, root!.val, upperBound)
    }
}
