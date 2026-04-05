class LRUCache {

    class Node {
        let key: Int
        var val: Int
        var prev: Node?
        var next: Node?

        init(key: Int, val: Int) {
            self.key = key
            self.val = val
        }
    }

    private let capacity: Int
    private var dict: [Int: Node] = [:]

    // create dummy head and tail
    private var head: Node
    private var tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity

        self.head = Node(key: 0, val: 0)
        self.tail = Node(key: 0, val: 0)
        // do wiring
        self.head.next = self.tail
        self.tail.prev = self.head
    }

    func get(_ key: Int) -> Int {
        guard let node: Node = self.dict[key] else {
            return -1
        }

        moveToFront(node) // move to front, since it is used.

        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = self.dict[key] {
            node.val = value
            moveToFront(node) // move to front, since it is used. :P
        } else {
            let node = Node(key: key, val: value)
            self.dict[key] = node
            addToFront(node)

            // check capacity and remove last if it exceeds
            if self.dict.count > self.capacity {
                let lru = self.removeTail()
                self.dict[lru.key] = nil
            }
        }
    }
}

// MARK: Helper Functions
extension LRUCache {
    private func addToFront(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }

    private func moveToFront(_ node: Node) {
        removeNode(node)
        addToFront(node)
    }

    private func removeNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func removeTail() -> Node {
        let node = tail.prev!
        removeNode(node)
        return node
    }
}
