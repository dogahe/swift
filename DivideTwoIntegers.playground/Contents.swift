func divide(_ dividend: Int, _ divisor: Int) -> Int {
    
    if divisor == 1 {
        let result = dividend
        if result >= 2147483648 {
            return 2147483647
        } else {
            return dividend
        }
    } else if divisor == -1 {
        let result = -dividend
        if result >= 2147483648 {
            return 2147483647
        } else {
            return result
        }
    }
    
    var div = abs(dividend)
    let dis = abs(divisor)
    
    var result: Int = 0
    while div >= dis {
        div -= dis
        result += 1
    }
    
    if result >= 2147483648 {
        return 2147483647
    }
    
    if (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0) {
        return -result
    } else {
        return result
    }
}

let dividend = -2147483648
let divisor = -1

divide(dividend, divisor)
