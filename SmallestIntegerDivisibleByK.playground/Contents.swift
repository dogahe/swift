import Foundation

func smallestRepunitDivByK(_ K: Int) -> Int {
    if K % 2 == 0 || K % 5 == 0 {
        return -1
    }
    var i: Int = 1
    while i < 100 {
        var num: String = ""
        var j:Int = i
        while j > 0 {
            num.append("1")
            j -= 1
        }
        print(num.count)
        let val: Int = Int(num)!
        if val % K == 0 {
            return num.count
        }
        i += 1
    }
    return -1
}

let K:Int = 23
smallestRepunitDivByK(K)
