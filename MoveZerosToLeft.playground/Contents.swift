/*

 a = [0, 3, 0, 5, 20]

 Outputs a = [3, 5, 20, 0, 0]

 In-place: no copy of the array or no storing elements in variables

 length: 0 to 100 // array of ints

 No in-built functions
 .append
  .remove // No change of the size of the
  .sort

 array

 edge cases:
 [0]
 [1]
 [2, 3, 4]
 [0, 0, 0]
 
 */

func moveZeros (_ nums: inout [Int]) {
    if nums.isEmpty {
        return
    }
    var left = 0
    var right = 1
    while right < nums.count {
        if nums[left] != 0 {
            left += 1
            right = left + 1
        } else {
            if nums[right] != 0 {
                nums[left] = nums[right]
                nums[right] = 0
                left += 1
                right = left + 1
            } else {
                right += 1
            }
        }
    }
}

var a: [Int] = [0, 3, 0, 5, 20]
moveZeros(&a)
print(a)
