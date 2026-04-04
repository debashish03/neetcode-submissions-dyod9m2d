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
    func hasCycle(_ head: ListNode?) -> Bool {
        var fastPointer: ListNode? = head
        var slowPointer: ListNode? = head

        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next

            if slowPointer === fastPointer {
                return true
            }
        }

        return false
    }
}
