/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root: TreeNode else { return [] }
        var result: [[Int]] = []

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let size = queue.count
            var level: [Int] = []

            for _ in 0..<size {
                let node = queue.removeFirst()

                level.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(level)
        }

        return result
    }
}
