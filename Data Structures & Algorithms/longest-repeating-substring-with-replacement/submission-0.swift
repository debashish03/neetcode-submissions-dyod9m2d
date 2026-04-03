class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charDict: [Character: Int] = [:]
        var left: Int = 0
        var maxFrequency: Int = 0
        var maxLength: Int = 0
        let sArray = Array(s)
        for right in 0..<sArray.count {
            let ch = sArray[right]
            charDict[ch, default: 0] += 1

            maxFrequency = max(maxFrequency, charDict[ch]!)
            let windowSize = right - left + 1

            // check if garbage count is more than K times in current window
            if windowSize - maxFrequency > k {
                charDict[sArray[left]]! -= 1 
                left += 1
            }

            maxLength = max(maxLength, right - left + 1) // new window size: right - left + 1
        }

        return maxLength  
    }
}
