/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    var head: ListNode?
    func reverseList(_ head: ListNode?) -> ListNode? {
        reverse(head)
        return self.head
    }

    func reverse(_ cur: ListNode?) {
        if cur?.next == nil {
            head = cur
            return
        }
        reverse(cur?.next)
        cur?.next?.next = cur
        cur?.next = nil
    }
}
