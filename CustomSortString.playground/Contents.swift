/*
 
 tags:Facebook
 
 791. Custom Sort String
 
 You are given two strings order and s. All the words of order are unique and were sorted in some custom order previously.

 Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

 Return any permutation of s that satisfies this property.

 Example 1:
 Input: order = "cba", s = "abcd"
 Output: "cbad"
 Explanation:
 "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".
 Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
 
 Example 2:
 Input: order = "cbafg", s = "abcd"
 Output: "cbad"
  
 Constraints:
 1 <= order.length <= 26
 1 <= s.length <= 200
 order and s consist of lowercase English letters.
 All the characters of order are unique.
 
 */

func customSortString(_ order: String, _ s: String) -> String {
    var dict: [Character: Int] = [:]
    for c in s {
        if let val = dict[c] {
            dict[c] = val + 1
        } else {
            dict[c] = 1
        }
    }
    
    var output: String = ""
    for c in order {
        if let v = dict[c] {
            var val = v
            while val > 0 {
                output.append(c)
                val -= 1
            }
            dict[c] = 0
        }
    }
    
    for (k, v) in dict {
        var val = v
        while val > 0 {
            output.append(k)
            val -= 1
        }
    }
    return output
}

let order = "cba", s = "abcd"
customSortString(order, s)

let order2 = "cbafg", s2 = "abcd"
customSortString(order2, s2)

let order3 = "kqep", s3 = "pekeq"
customSortString(order3, s3)

