class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 1, count: nums.count)

        var prefix: Int = 1
        for index in 0..<nums.count {
            let num = nums[index]
            result[index] = prefix
            prefix = prefix * num
        }

        var suffix = 1
        for index in (0..<nums.count).reversed() {
            result[index] *= suffix
            suffix *= nums[index]
        }

        return result
    }
}
