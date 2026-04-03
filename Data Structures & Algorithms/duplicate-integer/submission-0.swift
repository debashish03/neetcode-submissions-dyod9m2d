class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count != nums.count
    }
}
