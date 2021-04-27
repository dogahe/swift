//
//  main.swift
//  DecodeWays
//
//  Created by Behzad Dogahe on 4/22/21.
//

func numDecodings(_ s: String) -> Int {
    
    return numDecodingsDP(s, s.count)
    /*
    var results: [[String]] = []
    canDecode(s, [], &results)
    return results.count
 */
}

func numDecodingsDP(_ s: String, _ n: Int) -> Int {
    var count: [Int] = Array(repeating: 0, count: n + 1)
    count[0] = 1
    count[1] = 1
    if s.first == "0" {
        return 0
    }
    if n < 2 {
        return count[1]
    }
    for index in 2 ... n {
        count[index] = 0
        if let last = s.last {
            if last > "0" {
                count[index] = count[index - 1]
            }
        }
        let lastTwo = s.suffix(index).prefix(2)
        let lastTwoFirst = lastTwo.prefix(1)
        print(lastTwoFirst)
        if lastTwoFirst != "0" {
            if let num = Int(lastTwo) {
                if num < 27 {
                    count[index] += count[index - 2]
                }
            }
        }
        
    }
    return count[n]
}

func canDecode(_ s: String, _ codes: [String], _ results: inout [[String]]) {
    if s.isEmpty {
        results.append(codes)
        return
    }
    let a = String(s.prefix(1))
    if a == "0" {
        return
    } else {
        var updatedCodes = codes
        updatedCodes.append(a)
        canDecode(String(s.suffix(s.count - 1)), updatedCodes, &results)
    }
    if s.count > 1 {
        let b = String(s.prefix(2))
        if b.prefix(1) == "0" {
            return
        }
        if let num = Int(b), num < 27 {
            var updatedCodes = codes
            updatedCodes.append(b)
            canDecode(String(s.suffix(s.count - 2)), updatedCodes, &results)
        } else {
            return
        }
    }
    
}

print(numDecodings("2101"))
