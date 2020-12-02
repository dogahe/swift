import Foundation

func calculate(_ s: String) -> Int {
    //let ex = s.trimmingCharacters(in: .whitespaces)
    let ex = String(s.filter { !" ".contains($0) })
    var operands: [Int] = []
    var operations: [Character] = []
    var num: Int = 0
    var i: Int = 0
    while i < ex.count {
        let c = ex[ex.index(ex.startIndex, offsetBy: i)]
        if c.isNumber {
            num = num * 10 + Int(String(c))!
        } else {
            operands.append(num)
            num = 0
            if (c == "+" || c == "-") || ((c == "*" || c == "/") && (operations.last == "*" || operations.last == "/")) {
                if operations.count > 0 && operands.count > 1 {
                    let two = operands.removeLast()
                    let one = operands.removeLast()
                    let operation = operations.removeLast()
                    var result: Int
                    if operation == "*" {
                        result = one * two
                    } else if operation == "+" {
                        result = one + two
                    } else if operation == "-" {
                        result = one - two
                    } else {
                        result = one / two
                    }
                    operands.append(result)
                }
            }
            operations.append(c)
        }
        i += 1
    }
    operands.append(num)
    
    if operations.last == "/" || operations.last == "*" {
        let two = operands.removeLast()
        let one = operands.removeLast()
        let operation = operations.removeLast()
        var result: Int
        if operation == "*" {
            result = one * two
        } else {
            result = one / two
        }
        operands.append(result)
    }
    
    while operations.count > 0 && operands.count > 1 {
        let one = operands.removeFirst()
        let two = operands.removeFirst()
        let operation = operations.removeFirst()
        var result: Int
        if operation == "*" {
            result = one * two
        } else if operation == "+" {
            result = one + two
        } else if operation == "-" {
            result = one - two
        } else {
            result = one / two
        }
        operands.insert(result, at: 0)
    }
    return operands.last!
}

let s = "1*2-3/4+5*6-7*8+9/10"
//let s = "2*3+4"
calculate(s)
