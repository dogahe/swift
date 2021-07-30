//
//  main.swift
//  CrackingTheSafe
//
//  Created by Behzad Dogahe on 7/30/21.
//

/*
 
 tags:Google
 
 753. Cracking the Safe
 
 There is a box protected by a password. The password is a sequence of n digits where each digit can be in the range [0, k - 1].

 While entering a password, the last n digits entered will automatically be matched against the correct password.

 For example, assuming the correct password is "345", if you type "012345", the box will open because the correct password matches the suffix of the entered password.
 Return any password of minimum length that is guaranteed to open the box at some point of entering it.

 Example 1:
 Input: n = 1, k = 2
 Output: "10"
 Explanation: "01" will be accepted too.
 
 Example 2:
 Input: n = 2, k = 2
 Output: "01100"
 Explanation: "01100", "10011", "11001" will be accepted too.
  

 Constraints:
 1 <= n <= 4
 1 <= k <= 10
 1 <= kn <= 4096
 */
import Foundation

func crackSafe(_ n: Int, _ k: Int) -> String {
    var password = String(repeating: "0", count: n)
    var visitedCombination: Set<String> = []
    visitedCombination.insert(password)
    let target = Int(pow(Double(k), Double(n)))
    crackSafeAfter(&password, &visitedCombination, target, n, k)
    return password
}

func crackSafeAfter(_ password: inout String, _ visitedCombination: inout Set<String>, _ target: Int, _ n: Int, _ k: Int) -> Bool {
    if visitedCombination.count == target {
        return true
    }
    let lastDigits = password.suffix(n - 1)
    for i in 0 ..< k {
        let c = Character(UnicodeScalar(Character("0").asciiValue! + UInt8(i)))
        let newPassword = String(lastDigits) + String(c)
        if !visitedCombination.contains(newPassword) {
            visitedCombination.insert(newPassword)
            password.append(c)
            if crackSafeAfter(&password, &visitedCombination, target, n, k) {
                return true
            }
            visitedCombination.remove(newPassword)
            password.removeLast()
        }
    }
    return false
}

let n = 1, k = 2
print(crackSafe(n ,k))

let n2 = 2, k2 = 2
print(crackSafe(n2 ,k2))
