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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var start = dummy
        var track = dummy
        for _ in (0...n) {
            track = track?.next
        }
        while(track != nil) {
            start = start?.next
            track = track?.next
        }
        start?.next = start?.next?.next
        return dummy?.next
    }
}
