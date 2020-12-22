import Foundation

func reverse(_ x: Int32) -> Int32 {
    var sign: Int32 = -1
    if x > 0 {
        sign = 1
    }
    var y = abs(x)
    var sum: Int32 = 0
    while y > 0 {
        let rem = y % 10
        y = y / 10
        sum = sum * 10 + rem
    }
    return sum * sign
}

let x: Int32 = 153
reverse(x)
