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
    
    class Queue {
        var elements:[TreeNode] = []
        var front = 0

        func enqueue(_ val: TreeNode) {
            elements.append(val)
        }

        func dequeue() -> TreeNode? {
            if isEmpty() {
                return nil
            } else {
                let element = elements[front]
                front += 1
                return element
            }
        }

        func isEmpty() -> Bool {
            return front >= elements.count
        }

        func queueSize() -> Int {
            return elements.count - front
        }
    }
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var rightElements:[Int] = []
        let queue = Queue()
        if root != nil {
            queue.enqueue(root!)
        }
        while(!queue.isEmpty()) {
            for i in 0..<queue.queueSize() {
                let element = queue.dequeue()!
                if i == 0 {
                    rightElements.append(element.val)
                }
                if let right = element.right {
                    queue.enqueue(right)
                }
                if let left = element.left {
                    queue.enqueue(left)
                }
            }
        }
        return rightElements
    }
}
