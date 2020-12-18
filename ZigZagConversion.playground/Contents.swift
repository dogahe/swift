import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 {
        return s
    }
    var rowStrs: [String] = Array(repeating: "", count: numRows)
    var i = 0
    var row = 0
    var step = 1
    while i < s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        rowStrs[row].append(c)
        row += step
        if row == numRows {
            step = -1
            row = numRows - 2
        } else if row == -1 {
            step = 1
            row = 1
        }
        i += 1
    }
    var sum = ""
    for i in 0 ..< numRows {
        sum.append(rowStrs[i])
    }
    return sum
}

let s = "AB"
let numRows = 1

convert(s, numRows)

