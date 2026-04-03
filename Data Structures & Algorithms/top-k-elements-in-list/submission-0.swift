class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counter: [Int: Int] = [:]

        for num in nums {
            counter[num, default: 0] += 1
        }

        // create a bucket
        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        
        for (num, frequency) in counter {
            bucket[frequency].append(num)
        }

        // now get top K frequent elements
        var result: [Int] = []
        for index in (0..<bucket.count).reversed() {
            for num in bucket[index] {
                result.append(num)

                if result.count == k {
                    return result
                }
            }
        }

        return []
    }
}
