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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let head1 = list1 else { return list2 }
        guard let head2 = list2 else { return list1 }
        var list1Cur: ListNode? = head1
        var list2Cur: ListNode? = head2
        let head: ListNode
        var prev: ListNode 
        if head1.val > head2.val {
            head = head2
            prev = head
            list2Cur = head2.next
        } else {
            head = head1
            prev = head
            list1Cur = head1.next
        }
        while let node1 = list1Cur,
            let node2 = list2Cur {
            let cur: ListNode
            if node1.val > node2.val {
                cur = node2
                list2Cur = node2.next
            } else {
                cur = node1
                list1Cur = node1.next
            }
           
                prev.next = cur
                prev = cur
        }
        guard let _ = list1Cur else {
            prev.next = list2Cur
            return head
        }
        prev.next = list1Cur
        return head
    }
}
