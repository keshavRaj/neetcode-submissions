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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return searchRecursive(root, k: k)!
    }

    private var count = 0
    func searchRecursive(_ root: TreeNode?, k: Int) -> Int? {
        if root == nil {
            return nil
        }
        let leftSearch = searchRecursive(root?.left, k: k)
        if let val = leftSearch {
            return val
        }
        count += 1
        if count == k {
            return root!.val
        }
        return searchRecursive(root?.right, k: k)
    }
}
