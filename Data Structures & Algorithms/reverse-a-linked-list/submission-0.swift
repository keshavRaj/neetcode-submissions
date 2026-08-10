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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur = head
        while(cur != nil) {
            let temp = cur
            cur = cur?.next
            temp?.next = prev
            prev = temp
        }
        return prev

    }
}
