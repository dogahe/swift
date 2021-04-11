//
//  main.swift
//  MultiplyStrings
//
//  Created by Behzad Dogahe on 4/10/21.
//

import Foundation

func multiply(_ num1: String, _ num2: String) -> String {
    var elements: [String] = []
    var maxLength = 0
    for i in 0 ..< num2.count {
        let n2 = num2[num2.index(num2.startIndex, offsetBy: num2.count - 1 - i)]
        var carry: Int = 0
        let zeros = String(repeating: "0", count: i)
        var element: String = zeros
        for j in 0 ..< num1.count {
            let n1 = num1[num1.index(num1.startIndex, offsetBy: num1.count - 1 - j)]
            if let i1 = n1.wholeNumberValue, let i2 = n2.wholeNumberValue {
                let mul = i1 * i2 + carry
                let d = mul / 10
                let r = mul % 10
                carry = d
                element = "\(r)\(element)"
            }
        }
        if carry > 0 {
            element = "\(carry)\(element)"
        }
        maxLength = max(maxLength, element.count)
        elements.append(element)
    }
    print(elements, maxLength)
    var result = ""
    var carry = 0
    for i in 0 ..< maxLength {
        var sum = carry
        for element in elements {
            if element.count - 1 - i >= 0 {
                let n = element[element.index(element.startIndex, offsetBy: element.count - 1 - i)]
                if let num = n.wholeNumberValue {
                    sum += num
                }
            }
        }
        print("s: \(sum)")
        let d = sum / 10
        let r = sum % 10
        carry = d
        result = "\(r)\(result)"
        print("r: \(result), \(d)")
    }
    if carry > 0 {
        result = "\(carry)\(result)"
    }
    while result.count > 1 && result.first == "0" {
        result = String(result.dropFirst())
        print(result)
    }
    return result
}


let num2 = "123"
let num1 = "0"

multiply(num1, num2)

