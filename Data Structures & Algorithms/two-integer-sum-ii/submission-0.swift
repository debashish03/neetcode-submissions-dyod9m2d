class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left: Int = 0
        var right: Int = numbers.count - 1

        while left < right {
            let sum = numbers[left] + numbers[right]

            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                // increasing 1 as its 1-based index
                return [left + 1, right + 1]
            }
        }

        return []
    }
}
