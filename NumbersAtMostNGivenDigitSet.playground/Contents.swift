import Foundation

func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
    var output: String = ""
    var results: [String] = []
    doCreate(output: &output, digits: digits, level: 1, results: &results)
    print(results)
    return 0
}

func doCreate(output: inout String, digits: [String], level: Int, results: inout [String]) {
    if output.count == level {
        results.append(output)
        print(output)
        return
    }
    for digit in digits {
        output.append(digit)
        doCreate(output: &output, digits: digits, level: level - 1, results: &results)
        output.dropLast()
    }
    output = ""
    doCreate(output: &output, digits: digits, level: level + 1, results: &results)
}


let digits = ["1","3","5","7"]
let n = 100
atMostNGivenDigitSet(digits, n)
