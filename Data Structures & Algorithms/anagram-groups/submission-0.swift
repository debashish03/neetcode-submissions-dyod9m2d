class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]

        for str in strs {
            var counter = Array(repeating: 0, count: 26)

            for ch in str {
                let index = Int(ch.asciiValue! - Character("a").asciiValue!)
                counter[index] += 1
            }

            let key = counter.map{ String($0) }.joined(separator: "-")
            map[key, default: []].append(str)
        }

        return Array(map.values)
    }
}
