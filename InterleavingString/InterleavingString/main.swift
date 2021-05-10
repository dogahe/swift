//
//  main.swift
//  InterleavingString
//
//  Created by Behzad Dogahe on 5/6/21.
//

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    
    var p1 = 0
    var p2 = 0
    
    for p3 in 0 ..< s3.count {
        let c = s3[s3.index(s3.startIndex, offsetBy: p3)]
        
        var c1: Character? = nil
        var c2: Character? = nil
        
        if p1 < s1.count {
            c1 = s1[s1.index(s1.startIndex, offsetBy: p1)]
        }
        
        if p2 < s2.count {
            c2 = s2[s2.index(s2.startIndex, offsetBy: p2)]
        }

        var foundMatch: Bool = false
        if c == c1 {
            foundMatch = true
            p1 += 1
        } else if c == c2 {
            foundMatch = true
            p2 += 1
        }
        if !foundMatch {
            print(p1, p2, p3)
            return false
        }
    }
    return true
}

let s1 = "aabcc"
let s2 = "dbbca"
let s3 = "aadbbcbcac"
print(isInterleave(s1, s2, s3))

