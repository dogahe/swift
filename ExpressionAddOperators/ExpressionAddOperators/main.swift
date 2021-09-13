//
//  main.swift
//  ExpressionAddOperators
//
//  Created by Behzad Dogahe on 9/9/21.
//

/*
 
 tags:Facebook
 
 282. Expression Add Operators
 
 Given a string num that contains only digits and an integer target, return all possibilities to add the binary operators '+', '-', or '*' between the digits of num so that the resultant expression evaluates to the target value.

 Example 1:
 Input: num = "123", target = 6
 Output: ["1*2*3","1+2+3"]
 
 Example 2:
 Input: num = "232", target = 8
 Output: ["2*3+2","2+3*2"]
 
 Example 3:
 Input: num = "105", target = 5
 Output: ["1*0+5","10-5"]
 
 Example 4:
 Input: num = "00", target = 0
 Output: ["0*0","0+0","0-0"]
 
 Example 5:
 Input: num = "3456237490", target = 9191
 Output: []
  
 Constraints:
 1 <= num.length <= 10
 num consists of only digits.
 -231 <= target <= 231 - 1
 
 */

func addOperators(_ num: String, _ target: Int) -> [String] {
    var result: [String] = []
    if num.isEmpty {
        return result
    }
    helper(&result, "", num, target, 0, 0, 0)
    return result
}

func helper(_ result: inout [String], _ path: String, _ num: String, _ target: Int, _ pos: Int, _ eval: Int, _ multed: Int) {
    if pos == num.count {
        if eval == target {
            result.append(path)
        }
        return
    }
    for i in pos ..< num.count {
        if i != pos && num[num.index(num.startIndex, offsetBy: pos)] == "0" {
            break
        }
        let curr = String(num[num.index(num.startIndex, offsetBy: pos) ... num.index(num.startIndex, offsetBy: i)])
        if pos == 0 {
            helper(&result, "\(path)\(curr)" , num, target, i + 1, Int(curr)!, Int(curr)!)
        } else {
            helper(&result, "\(path)+\(curr)" , num, target, i + 1, eval + Int(curr)!, Int(curr)!)
            helper(&result, "\(path)-\(curr)" , num, target, i + 1, eval - Int(curr)!, -Int(curr)!)
            helper(&result, "\(path)*\(curr)" , num, target, i + 1, eval - multed + multed*Int(curr)!, multed*Int(curr)!)
        }
    }
}

let num = "123", target = 6
let output = addOperators(num, target)
print(output)

let num2 = "232", target2 = 8
let output2 = addOperators(num2, target2)
print(output2)

let num3 = "105", target3 = 5
let output3 = addOperators(num3, target3)
print(output3)

let num4 = "00", target4 = 0
let output4 = addOperators(num4, target4)
print(output4)

let num5 = "3456237490", target5 = 9191
let output5 = addOperators(num5, target5)
print(output5)

