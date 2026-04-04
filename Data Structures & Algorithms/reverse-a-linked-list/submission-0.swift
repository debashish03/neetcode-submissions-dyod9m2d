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
        guard let head: ListNode else { return nil }

        var currentNode: ListNode? = head
        var previousNode: ListNode? = nil

        while currentNode != nil {
            let nextNode: ListNode? = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }

        return previousNode
    }
}
