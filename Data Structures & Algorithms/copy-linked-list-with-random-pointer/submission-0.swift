/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var originalMap:[Node: Node] = [:]
        guard let head = head else { return nil }
        var cur: Node? = head
        while(cur != nil) {
            let node = Node(cur!.val)
            originalMap[cur!] = node
            cur = cur!.next
        }
        let newHead = originalMap[head]!
        var newCur: Node? = newHead
        cur = head
        while(cur != nil) {
            newCur?.next = cur?.next.flatMap{originalMap[$0]}
            newCur?.random = cur?.random.flatMap{originalMap[$0]}
            cur = cur?.next
            newCur = newCur?.next
        }
        return newHead
    }
}
