import Foundation

func intToRoman(_ num: Int) -> String {
    let arr = [(1000, "M"), (100, "C"), (10, "X"), (1, "I")]
    let mids = [(5000, "F"), (500,"D"), (50, "L"), (5, "V")]
    var index = 0
    var n = num
    var numParts: [Int] = []
    while n > 0 {
        let curr = arr[index].0
        let part = n/curr
        numParts.append(part)
        n = n % curr
        index += 1
    }
    var str: String = ""
    for i in 0  ..< numParts.count {
        let n = numParts[i]
        if n == 0 {
            
        } else if n > 0 && n <= 3 {
            str += String(repeating: arr[i].1, count: n)
        } else if n == 4 {
            str += arr[i].1 + mids[i].1
        } else if n < 9 {
            str += mids[i].1 + String(repeating: arr[i].1, count: n - 5)
        } else {
            str += arr[i].1 + arr[i - 1].1
        }
    }
    return str
}

let num = 3
intToRoman(num)
