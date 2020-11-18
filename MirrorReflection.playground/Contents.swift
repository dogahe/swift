/*
 Mirror Reflection
 
 There is a special square room with mirrors on each of the four walls.  Except for the southwest corner, there are receptors on each of the remaining corners, numbered 0, 1, and 2.
 
 The square room has walls of length p, and a laser ray from the southwest corner first meets the east wall at a distance q from the 0th receptor.
 
 Return the number of the receptor that the ray meets first.  (It is guaranteed that the ray will meet a receptor eventually.)
 
 
 
 Example 1:
 
 
 Input: p = 2, q = 1
 Output: 2
 Explanation: The ray meets receptor 2 the first time it gets reflected back to the left wall.
 
 Note:
 
 1 <= p <= 1000
 0 <= q <= p
 
 */
import Foundation

func mirrorReflection(_ p: Int, _ q: Int) -> Int {
    var k:Int = 1
    while true {
        let multiple = k * p
        if Double(multiple)/Double(q) == Double(multiple/q) {
            break
        } else {
            k = k + 1
        }
    }
    let j = k * p / q
    if k % 2 == 0 {
        return 0
    } else {
        if j % 2 == 0 {
            return 2
        } else {
            return 1
        }
    }
}


print(mirrorReflection(3, 3))
