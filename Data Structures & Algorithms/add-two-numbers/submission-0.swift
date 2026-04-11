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
        addTwoNumbers(l1, l2, 0)
    }

    private func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        if l1 == nil && l2 == nil && carry == 0 {
            return nil
        }

        let v1 = l1?.val ?? 0
        let v2 = l2?.val ?? 0

        let sum = v1 + v2 + carry
        let newCarry = sum / 10
        let val = sum % 10

        let nextNode = addTwoNumbers(l1?.next, l2?.next, newCarry)
        let listNode = ListNode(val)
        listNode.next = nextNode
        return listNode
    }
}
