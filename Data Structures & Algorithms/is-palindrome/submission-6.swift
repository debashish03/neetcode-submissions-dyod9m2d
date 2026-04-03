class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var l = 0, r = chars.count - 1

        while l < r {
            while l < r && !isAlphaNum(chars[l]) {
                l += 1
            }
            while r > l && !isAlphaNum(chars[r]) {
                r -= 1
            }
            if chars[l].lowercased() != chars[r].lowercased() {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }

    private func isAlphaNum(_ c: Character) -> Bool {
        return c.isLetter || c.isNumber
    }
}
