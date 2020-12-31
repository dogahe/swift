import Foundation

func reachNumber(_ target: Int) -> Int {
    var curr = 0
    var inc = 1
    var count = 0
    while curr != target {
        if target > 0 {
            if curr + inc <= target {
                curr += inc
            } else {
                curr -= inc
            }
        } else {
            if curr - inc >= target {
                curr -= inc
            } else {
                curr += inc
            }
        }
        
        inc += 1
        count += 1
    }
    return count
}

let target = -2
reachNumber(target)
