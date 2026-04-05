/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head: Node else { return nil }

        var map: [ObjectIdentifier: Node] = [:]
        var current: Node? = head

        while current != nil {
            let node = Node(current!.val)
            map[ObjectIdentifier(current!)] = node
            current = current!.next
        }

        current = head

        while let node = current {
            let copy = map[ObjectIdentifier(node)]
            
            if let next = node.next {
                copy?.next = map[ObjectIdentifier(next)]
            }
            
            if let random = node.random {
                copy?.random = map[ObjectIdentifier(random)]
            }
            
            current = node.next
        }

        return map[ObjectIdentifier(head)]
    }
}
