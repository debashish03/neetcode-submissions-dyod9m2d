class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        for i in 0..<9 {
            for j in 0..<9 {
                let char = board[i][j]

                if char == "." { continue }

                // row check
                if rows[i].contains(char) { return false }
                rows[i].insert(char)

                // Column check
                if columns[j].contains(char) { return false }
                columns[j].insert(char)

                // Box check
                let boxIndex = (i / 3) * 3 + (j / 3)
                if boxes[boxIndex].contains(char) { return false }
                boxes[boxIndex].insert(char)
            }
        }

        return true
    }
}
