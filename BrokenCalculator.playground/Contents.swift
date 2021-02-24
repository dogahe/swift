import Foundation

func brokenCalc(_ X: Int, _ Y: Int) -> Int {
    return helper(X, Y, 0)
}

func helper(_ curr: Int, _ dest: Int, _ sum: Int) -> Int {
    print(curr, dest, sum)
    if curr == dest {
        return sum
    }
    let subtract = helper(curr - 1, dest, sum + 1)
    let doubled = helper(curr * 2, dest, sum + 1)
    return min(subtract, doubled)
}

let X = 2
let Y = 3

brokenCalc(X, Y)
