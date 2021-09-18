/*
 
 tags:Google
 tags:Facebook
 
247. Strobogrammatic Number II

 Given an integer n, return all the strobogrammatic numbers that are of length n. You may return the answer in any order.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

 Example 1:
 Input: n = 2
 Output: ["11","69","88","96"]
 
 Example 2:
 Input: n = 1
 Output: ["0","1","8"]
  
 Constraints:

 1 <= n <= 14
*/


func findStrobogrammatic(_ n: Int) -> [String] {
    findStrobogrammatic(n, n)
}

func findStrobogrammatic(_ n: Int, _ m: Int) -> [String] {
    if n == 0 {
        return [""]
    } else if n == 1 {
        return ["0", "1", "8"]
    } else {
        let inner = findStrobogrammatic(n - 2, m)
        var output: [String] = []
        for i in 0 ..< inner.count {
            if n != m {
                output.append("0" + inner[i] + "0")
            }
            output.append("1" + inner[i] + "1")
            output.append("8" + inner[i] + "8")
            output.append("6" + inner[i] + "9")
            output.append("9" + inner[i] + "6")
        }
        return output
    }
}

print(findStrobogrammatic(3))
