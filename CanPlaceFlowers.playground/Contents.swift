/*
 
 Can Place Flowers
 
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
 
 
*/

import Foundation

// Simpler Solution

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var i  = 0
    var count = 0
    var planted = flowerbed
    while i < planted.count {
        if planted[i] == 0 && (i == 0 || planted[i - 1] == 0) && (i == planted.count - 1 || planted[i + 1] == 0 ) {
            planted[i] = 1
            count += 1
            if count >= n {
                return true
            }
        }
        i += 1
    }
    return count >= n
}


// Complicated Solution
/*
func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    if flowerbed.count == 1 {
        if flowerbed[0] == 0 && n == 1 {
            return true
        }
    }
    var total: Int = 0
    var cz:Int = 0
    
    var initialIndex = 0
    if flowerbed[0] == 1 {
        initialIndex = 1
    }
    var countingZeros: Bool = false
    for index in 0 ..< flowerbed.count {
        if flowerbed[index] == 0 {
            cz += 1
            countingZeros = true
        } else if countingZeros && (flowerbed[index] != 0 || index == flowerbed.count - 1) {
            if initialIndex == 0 {
                let possible = max(0, cz - 1)
                total += Int(ceil(Double(possible) / 2))
                initialIndex = 1
            } else {
                let possible = max(0, cz - 2)
                total += Int(ceil(Double(possible) / 2))
            }
            print(total)
            if total >= n {
                return true
            }
            cz = 0
        }
    }
    if flowerbed.count == cz {
        let possible = max(0, cz)
        total += Int(ceil(Double(possible) / 2))
        print(total)
    } else {
        let possible = max(0, cz - 1)
        total += Int(ceil(Double(possible) / 2))
        print(total)
    }
    return total >= n
}
*/

let flowerbed = [1,0,1,0,1,0,1]
 //[0,0,1,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0]//[0,0,0]//[1,0,0,0,0,1]

let n = 0


canPlaceFlowers(flowerbed, n)
