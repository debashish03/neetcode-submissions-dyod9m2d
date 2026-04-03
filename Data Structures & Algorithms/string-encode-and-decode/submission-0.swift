class Solution {

    func encode(_ strs: [String]) -> String {
        var result = ""

        for str in strs {
            result += "\(str.count)#\(str)"
        }

        return result
    }

    func decode(_ str: String) -> [String] {
        var result: [String] = []
        var i = str.startIndex

        while i < str.endIndex {
            var j = i

            while str[j] != "#" {
                j = str.index(after: j)
            }

            // calculate length
            let length = Int(str[i..<j])!

            // extract string
            let startIndex = str.index(after: j)
            let endIndex = str.index(startIndex, offsetBy: length)

            let resultString = String(str[startIndex..<endIndex])
            result.append(resultString)
            
            i = endIndex
        }

        return result
    }
}
