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
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        //Find middle
        while(fast?.next?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let secondHalf = slow?.next
        slow?.next = nil
        //Reverse second half
        var prev: ListNode? = nil
        var cur = secondHalf
        while(cur != nil) {
            let temp = cur
            cur = cur?.next
            temp?.next = prev
            prev = temp
        }

        //now insert at the positions
        var reversed = prev
        var insertionPosition = head
        while(reversed != nil) {
            let temp = insertionPosition?.next
            insertionPosition?.next = reversed
            let reversedTemp = reversed
            reversed = reversed?.next
            reversedTemp?.next = temp
            insertionPosition = insertionPosition?.next?.next
        }
    }
}
