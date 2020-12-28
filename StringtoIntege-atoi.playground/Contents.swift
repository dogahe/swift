import Foundation

func myAtoi(_ s: String) -> Int {
    var i = 0
    var sum: Int? = nil
    var isNegative: Bool = false
    while i < s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if c == "-" && sum == nil {
            isNegative = true
            sum = 0
        } else if c == "+" && sum == nil {
            sum = 0
        } else if c.isNumber {
            if let num = c.wholeNumberValue {
                if sum == nil {
                    sum = 0
                }
                sum = sum!*10 + num
                var value: Int
                if isNegative {
                    value = -sum!
                } else {
                    value = sum ?? 0
                }
                if value > Int32.max{
                    return Int(Int32.max)
                } else if  value < Int32.min {
                    return Int(Int32.min)
                } 
            }
        } else if c == " " {
            if sum != nil {
                break
            }
        }  else if !c.isNumber {
            break
        }
        i = i + 1
    }
    var value: Int
    if isNegative {
        value = -sum!
    } else {
        value = sum ?? 0
    }
    if value > Int32.max{
        return Int(Int32.max)
    } else if  value < Int32.min {
        return Int(Int32.min)
    } else {
        return value
    }
}

let str = "20000000000000000000"
myAtoi(str)


