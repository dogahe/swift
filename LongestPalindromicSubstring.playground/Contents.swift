import Foundation

func longestPalindrome(_ s: String) -> String {
    var table: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var maxLength = 1
    for i in 0 ..< s.count {
        table[i][i] = true
    }
    var start = 0
    if s.count > 1 {
        for i in 0 ..< s.count - 1 {
            if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: i + 1)]  {
                table[i][i + 1] = true
                start = i
                maxLength = 2
            }
        }
    }
    
    if s.count > 2 {
        for k in 3 ... s.count {
            print(k)
            for i in 0 ..< s.count - k + 1 {
                let j = i + k - 1
                
                if table[i + 1][j - 1] && s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                    table[i][j] = true;

                    if (k > maxLength) {
                        start = i
                        maxLength = k
                    }
                }
            }
        }
    }
    return String(s[s.index(s.startIndex, offsetBy: start) ... s.index(s.startIndex, offsetBy: start + maxLength - 1)])
 
}

//let s = "forgeeksskeegfor"//"ccc"//"forgeeksskeegfor"//"babad"

let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

longestPalindrome(s)
