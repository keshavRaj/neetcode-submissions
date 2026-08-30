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
            if !isEmpty() {
                let element = elements[front]
                front += 1
                return element
            } else {
                return nil
            }
        }

        func isEmpty() -> Bool {
            return front >= elements.count
        }

        func queueSize() -> Int {
            return elements.count - front
        }
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var levelElements:[[Int]] = []
        let queue = Queue()
        if root != nil {
            queue.enqueue(root!)
        }
        while(!queue.isEmpty()) {
            var level: [Int] = []
            for _ in 0..<queue.queueSize() {
                let element = queue.dequeue()!
                level.append(element.val)
                if let left = element.left {
                    queue.enqueue(left)
                }
                if let right = element.right {
                    queue.enqueue(right)
                }
            }
            levelElements.append(level)
        }
        return levelElements 
    }
}
