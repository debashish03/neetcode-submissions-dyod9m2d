class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }

        let s2Array = Array(s2)
        
        // keep the frequency of characters
        var s1Count = Array(repeating: 0, count: 26)
        var windowCount = Array(repeating: 0, count: 26)

        for ch in s1 {
            let index = Int(ch.asciiValue! - Character("a").asciiValue!)
            s1Count[index] += 1
        }

        var left: Int = 0
        for right in 0..<s2Array.count {
            let ch = s2Array[right]
            let index = Int(ch.asciiValue! - Character("a").asciiValue!)
            windowCount[index] += 1

            // maintain window size
            let windowSize = right - left + 1
            if windowSize > s1.count {
                let leftChar = s2Array[left]
                let leftCharIndex = Int(leftChar.asciiValue! - Character("a").asciiValue!)
                windowCount[leftCharIndex] -= 1

                left += 1
            }


            // compare window count.
            if windowCount == s1Count {
                return true
            }
        }

        return false
    }
}
