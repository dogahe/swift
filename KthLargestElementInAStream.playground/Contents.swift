
class KthLargest {

    var k: Int
    var nums: [Int]
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }
    
    func add(_ val: Int) -> Int {
        nums.append(val)
        return findKthLargest(nums, k)
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var numsCopy = nums
        return randomizedSelect(&numsCopy, 0, nums.count - 1, k)
    }

    func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
        let x = arr[r]
        var i = p - 1
        for j in p ... r - 1 {
            if arr[j] >= x {
                i += 1
                let temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
        let temp = arr[i + 1]
        arr[i + 1] = arr[r]
        arr[r] = temp
        return i + 1
    }

    func randomizedPartition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
        let i = Int.random(in: p ... r)
        let temp = arr[i]
        arr[i] = arr[r]
        arr[r] = temp
        return partition(&arr, p, r)
    }

    func randomizedSelect(_ arr: inout [Int], _ p: Int, _ r: Int, _ i: Int) -> Int {
        if p == r {
            return arr[p]
        }
        let q = randomizedPartition(&arr, p, r)
        let k = q - p + 1
        if i == k {
            return arr[q]
        } else if i < k {
            return randomizedSelect(&arr, p, q - 1, i)
        } else {
            return randomizedSelect(&arr, q + 1, r, i - k)
        }
    }
}


let k = 3
let nums = [4, 5, 8, 2]
let obj = KthLargest(k, nums)
let ret1: Int = obj.add(3)
let ret2: Int = obj.add(5)
let ret3: Int = obj.add(10)
let ret4: Int = obj.add(9)

