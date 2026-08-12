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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let totalSum = (l1?.val ?? 0) + (l2?.val ?? 0)
        var carry = totalSum / 10
        var rem = totalSum % 10
        let head = ListNode(rem)
        var cur: ListNode? = head
        var list1Cur = l1?.next
        var list2Cur = l2?.next
        while((list1Cur != nil) || (list2Cur != nil)) {
            let totalSum = (list1Cur?.val ?? 0) + (list2Cur?.val ?? 0) + carry
            carry = totalSum / 10
            let rem = totalSum % 10
            let newNode = ListNode(rem)
            cur?.next = newNode
            list1Cur = list1Cur?.next 
            list2Cur = list2Cur?.next
            cur = cur?.next
        }
        if carry > 0 {
            let newNode = ListNode(carry)
            cur?.next = newNode
        }
        return head


    }
}
