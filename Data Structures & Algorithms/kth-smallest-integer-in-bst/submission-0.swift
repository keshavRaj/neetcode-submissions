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
        var list: [Int] = []
        createSortedList(root, list: &list)
        return list[k - 1]

    }

    func createSortedList(_ root: TreeNode?, list: inout [Int]) {
        if root == nil {
            return 
        }
        createSortedList(root?.left, list: &list)
        list.append(root!.val)
        createSortedList(root?.right, list: &list)
    }
}
