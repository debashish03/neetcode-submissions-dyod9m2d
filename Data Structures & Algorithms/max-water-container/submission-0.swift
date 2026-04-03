class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1
        var maxWater = 0

        while left < right {
            let width = right - left
            let height = min(heights[left], heights[right])

            maxWater = max(maxWater, height * width) 

            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }            
        }

        return maxWater
    }
}
