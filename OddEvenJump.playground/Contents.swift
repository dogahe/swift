func oddEvenJumps(_ arr: [Int]) -> Int {
    var sum = 0
    for i in 0 ..< arr.count {
        var num = arr[i]
        var jump = 1
        var j = i + 1
        while j < arr.count {
            if jump % 2 == 1 {
                if arr[j] >= num {
                    num = arr[j]
                    jump += 1
                }
            } else {
                if arr[j] <= num {
                    num = arr[j]
                    jump += 1
                }
            }
            j += 1
        }
        if num == arr[arr.count - 1] {
            sum += 1
        }
    }
    return sum
}

let arr = [10,13,12,14,15]
oddEvenJumps(arr)

let arr2 = [2,3,1,1,4]
oddEvenJumps(arr2)

let arr3 = [5,1,3,4,2]
oddEvenJumps(arr3)

