class Solution {
    func isValid(_ s: String) -> Bool {
        var bracketPairs: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        var stack: [Character] = []

        for ch in s {
            if let openBracket = bracketPairs[ch] {
                if !stack.isEmpty && stack.last! == openBracket {
                    stack.popLast()
                } else {
                    return false
                }
            } else {
                stack.append(ch)
            }
        }

        return stack.isEmpty
    }
}
