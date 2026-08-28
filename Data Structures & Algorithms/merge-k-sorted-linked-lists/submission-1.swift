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
    var lists: [ListNode?] = []
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        self.lists = lists
        return mergeRange(0, lists.count - 1)

    }

    func mergeRange(_ l: Int, _ r: Int) -> ListNode? {
        if l == r {
            return lists[l]
        } else if l > r {
            return nil
        } else {
            let mid = (l + r) / 2
            let leftMerged = mergeRange(l, mid)
            let rightMerged = mergeRange(mid + 1, r)
            return mergeLists(leftMerged, rightMerged) 
        }
    }

    func mergeLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var head = ListNode(-1)
        var cur: ListNode? = head
        var list1Cur = list1
        var list2Cur = list2
        while(list1Cur != nil && list2Cur != nil) {
            if list1Cur!.val <= list2Cur!.val {
                cur?.next = list1Cur
                cur = list1Cur
                list1Cur = list1Cur!.next
            } else {
                cur?.next = list2Cur
                cur = list2Cur
                list2Cur = list2Cur!.next
            }
        }
        while(list1Cur != nil) {
            cur?.next = list1Cur
            cur = list1Cur
            list1Cur = list1Cur!.next
        }
        while(list2Cur != nil) {
            cur?.next = list2Cur
            cur = list2Cur
            list2Cur = list2Cur!.next
        }
        return head.next
    }
}
