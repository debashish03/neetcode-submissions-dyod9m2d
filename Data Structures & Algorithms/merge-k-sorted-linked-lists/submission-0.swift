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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }

        var lists = lists

        while lists.count > 1 {
            var merged: [ListNode?] = []

            for i in stride(from: 0, to: lists.count, by: 2) {
                let l1 = lists[i]
                let l2 = lists.count > (i + 1) ? lists[i + 1] : nil

                let result = mergeTwoList(l1, l2)
                merged.append(result)
            }

            lists = merged
        }
        
        return lists.first!
    }

    private func mergeTwoList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummy = ListNode(0)
        var tail = dummy

        while l1 != nil, l2 != nil {
            if l1!.val < l2!.val {
                tail.next = l1
                l1 = l1!.next
            } else {
                tail.next = l2
                l2 = l2?.next
            }

            tail = tail.next!
        }

        tail.next = l1 ?? l2
        return dummy.next
    }
}
