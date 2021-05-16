/*
func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count {
        return []
    }
    var dict: [Character: Int] = [:]
    for i in 0 ..< p.count {
        let c = p[p.index(p.startIndex, offsetBy: i)]
        if let val = dict[c] {
            dict[c] = val + 1
        } else {
            dict[c] = 1
        }
    }
    var results: [Int] = []
    for i in 0 ... s.count - p.count {
        var dictCopy = dict
        var failed = false
        for j in 0 ..< p.count {
            let c = s[s.index(s.startIndex, offsetBy: i + j)]
            if let val = dictCopy[c], val > 0 {
                dictCopy[c] = val - 1
            } else {
                failed = true
                break
            }
        }
        if !failed {
            results.append(i)
        }
    }
    return results
}
*/

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count {
        return []
    }
    var phash = Array(repeating: 0, count: 26)
    for i in 0 ..< p.count {
        let c = p[p.index(p.startIndex, offsetBy: i)]
        phash[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
    }
    var shash = Array(repeating: 0, count: 26)
    for i in 0 ..< p.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        shash[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
    }
    var result: [Int] = []
    var left = 0
    var right = p.count - 1
    if shash == phash {
        result.append(left)
    }
    while right < s.count - 1 {
        right += 1
        let rc = s[s.index(s.startIndex, offsetBy: right)]
        let lc = s[s.index(s.startIndex, offsetBy: left)]
        left += 1
        shash[Int(lc.asciiValue! - Character("a").asciiValue!)] -= 1
        shash[Int(rc.asciiValue! - Character("a").asciiValue!)] += 1
        if shash == phash {
            result.append(left)
        }
    }
    return result
}

let s = "cbaebabacd"//"abab"
let p = "abc"//"ab"
findAnagrams(s, p)

