import Foundation

func findLUSlength(_ strs: [String]) -> Int {
    var dict: [String: Int] = [:]
    for str in strs {
        if let c = dict[str] {
            dict[str] = c + 1
        } else {
            dict[str] = 1
        }
    }
    let sortedStrs = strs.sorted { $0.count > $1.count }
    for str in sortedStrs {
        if let c = dict[str] {
            if c == 1 {
                var isSub: Bool = false
                for strToCompare in sortedStrs {
                    if isSubsequence(str, strToCompare) && str != strToCompare {
                        isSub = true
                        break
                    }
                }
                if !isSub {
                    return str.count
                }
            }
        }
    }
    return -1
}

func isSubsequence(_ a: String, _ b: String) -> Bool {
    var i = 0
    var j = 0
    while i < a.count && j < b.count {
        let aChar = a[a.index(a.startIndex, offsetBy: i)]
        let bChar = b[b.index(b.startIndex, offsetBy: j)]
        if aChar == bChar {
            i = i + 1
        }
        j = j + 1
    }
    return i == a.count
}

let strs = ["aaa", "aaa", "aa"]

findLUSlength(strs)

isSubsequence("ab", "bacsdfsdfsdfr")
