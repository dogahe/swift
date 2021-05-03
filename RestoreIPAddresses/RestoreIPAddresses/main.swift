//
//  main.swift
//  RestoreIPAddresses
//
//  Created by Behzad Dogahe on 4/30/21.
//

/*
 
 93. Restore IP Addresses

 Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.

 A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses.

  

 Example 1:

 Input: s = "25525511135"
 Output: ["255.255.11.135","255.255.111.35"]
 Example 2:

 Input: s = "0000"
 Output: ["0.0.0.0"]
 Example 3:

 Input: s = "1111"
 Output: ["1.1.1.1"]
 Example 4:

 Input: s = "010010"
 Output: ["0.10.0.10","0.100.1.0"]
 Example 5:

 Input: s = "101023"
 Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
  

 Constraints:

 0 <= s.length <= 3000
 s consists of digits only.
 
*/

func restoreIpAddresses(_ s: String) -> [String] {
    var results: [[String]] = []
    let curr: [String] = []
    helper(s, curr, &results)
    let outout = results.map( { $0.joined(separator: ".") } )
    return outout
}

func helper(_ str: String, _ curr: [String], _ results: inout [[String]]) {
    if curr.count == 4 && str.isEmpty {
        results.append(curr)
        return
    }
    if curr.count == 4 || str.isEmpty {
        return
    }

    let l1 = String(str.prefix(1))
    var newCurr = curr
    newCurr.append(l1)
    helper(String(str.suffix(str.count - 1)), newCurr, &results)
    
    if str.count > 1 {
        let l2 = String(str.prefix(2))
        if l2.prefix(1) != "0" {
            var newCurr = curr
            newCurr.append(l2)
            helper(String(str.suffix(str.count - 2)), newCurr, &results)
        }
        
        if str.count > 2 {
            let l3 = String(str.prefix(3))
            if l3.prefix(1) != "0" {
                if let num = Int(l3), num < 256 {
                    var newCurr = curr
                    newCurr.append(l3)
                    helper(String(str.suffix(str.count - 3)), newCurr, &results)
                }
            }
        }
    }
}

let s = "101023"//"1111"//"25525511135"
let output = restoreIpAddresses(s)
print(output)

