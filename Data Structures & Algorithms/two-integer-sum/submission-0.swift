class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]

        for index in 0..<nums.count {
            let num = nums[index]
            let requiredValue = target - num

            if let value = dict[num] {
                return [value, index]
            } else {
                dict[requiredValue] = index
            }
        }

        return [] 
    }
}
