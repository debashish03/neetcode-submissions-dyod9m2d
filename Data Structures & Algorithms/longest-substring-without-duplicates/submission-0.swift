class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charSet = Set<Character>()
        let sArray = Array(s)
        var left = 0
        var maxLength = 0
        
        for right in 0..<sArray.count {
            let ch = sArray[right]
            
            while charSet.contains(ch) {
                charSet.remove(sArray[left])
                left += 1
            }
            
            charSet.insert(ch)
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}
