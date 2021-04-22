/*

 89. Gray Code
 
 The gray code is a binary numeral system where two successive values differ in only one bit.

 Given an integer n representing the total number of bits in the code, return any sequence of gray code.

 A gray code sequence must begin with 0.

  

 Example 1:

 Input: n = 2
 Output: [0,1,3,2]
 Explanation:
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 [0,2,3,1] is also a valid gray code sequence.
 00 - 0
 10 - 2
 11 - 3
 01 - 1
 Example 2:

 Input: n = 1
 Output: [0,1]
  

 Constraints:

 1 <= n <= 16

*/

func grayCode(_ n: Int) -> [Int] {
    var arr: [String] = ["0", "1"]
    var i = 1
    while i < n {
        let rev = arr.reversed()
        arr.append(contentsOf: rev)
        for index in 0 ... arr.count/2 - 1 {
            arr[index] = "0\(arr[index])"
        }
        for index in arr.count/2 ... arr.count - 1 {
            arr[index] = "1\(arr[index])"
        }
        i += 1
    }
    print(arr)
    let result = arr.map { toInt($0) }
    return result
}


func toInt(_ str: String) -> Int {
    var s = str
    var sum = 0
    while !s.isEmpty {
        if let c = s.first {
            s = String(s.dropFirst())
            if c == "1" {
                sum = sum*2 + 1
            } else {
                sum = sum*2 + 0
            }
        }
    }
    return sum
}

let n = 3
grayCode(n)
