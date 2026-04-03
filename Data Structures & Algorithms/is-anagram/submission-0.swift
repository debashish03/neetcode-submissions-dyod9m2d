class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var counter = Array(repeating: 0, count: 26)

        for char in s {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            counter[index] += 1
        }

        for char in t {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            counter[index] -= 1
        }

        for count in counter where count != 0 {
            return false
        }

        return true
    }
}
