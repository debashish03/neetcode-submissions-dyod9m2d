class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var nums = Set(nums)
        var longest = 0

        for num in nums {
            if !nums.contains(num - 1) {
                var current = num
                var length = 1

                while nums.contains(current + 1) {
                    current += 1
                    length += 1
                }

                longest = max(longest, length)
            }
        }

        return longest
    }
}
