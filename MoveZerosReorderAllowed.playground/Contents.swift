/*

 Return number of non-zero elements
 Modify the array to move non-zeros elements to the left

 input: [0, 4, 3, 0, 5]
 valid output: 3, [4, 3, 5, 0, 0]
 
 valid output: 3, [4, 5, 3, 0, 0]
 Left side (non-zero elements) can be re-ordered.
 
*/


func moveZeros(_ nums: inout [Int]) -> Int  {
    var count = 0
    var left = 0
    var right = nums.count - 1
    while left < right {
        if nums[left] != 0 {
            count += 1
            left += 1
        } else {
            if nums[right] == 0 {
                right -= 1
            } else {
                count += 1
                nums[left] = nums[right]
                nums[right] = 0
                left += 1
                right -= 1
            }
        }
    }
    if nums[left] != 0 {
        count += 1
    }
    return count
}


//var nums = [0, 1, 0, 3, 12]
var nums = [34, 0, 90, 1, 0, 3, 12]

moveZeros(&nums)
