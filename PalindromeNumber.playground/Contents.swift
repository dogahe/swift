import Foundation

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    var y = x
    var sum = 0
    while y > 0 {
        let r = y % 10
        sum = sum*10 + r
        y = y / 10
    }
    if sum == x {
        return true
    }
    return false
}

let x = 10
isPalindrome(x)
