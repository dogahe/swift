func myPow(_ x: Double, _ n: Int) -> Double {
    
    var absN = abs(n)
    var result: Double = 1
    while absN > 0 {
        result *= x
        absN -= 1
    }
    if n < 0 {
        result = 1/result
    }
    return result
}

let x = 2.0
let n = -2

myPow(x, n)
