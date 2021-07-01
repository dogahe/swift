func countSmaller(_ nums: [Int]) -> [Int] {
    var result: [Int] = []
    for i in 0 ..< nums.count {
        var size = 0
        for j in i + 1 ..< nums.count {
            if nums[j] < nums[i] {
                size += 1
            }
        }
        result.append(size)
    }
    return result
}

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var lesser: Int
    
    init() { self.val = 0; self.lesser = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.lesser = 0; self.left = nil; self.right = nil; }
    init(_ val: Int, _ lesser: Int) { self.val = val; self.lesser = lesser; self.left = nil; self.right = nil; }
}

func countSmallerFast(_ nums: [Int]) -> [Int] {
    var tree: TreeNode? = nil
    var arr: [Int] = []
    for i in 0 ..< nums.count {
        let num = nums[nums.count - 1 - i]
        insert(&tree, num, 0, &arr)
    }
    return arr.reversed()
}

func insert(_ tree: inout TreeNode?, _ val: Int, _ lesser: Int, _ arr: inout [Int]) {
    if tree == nil {
        tree = TreeNode(val)
        arr.append(lesser)
    } else {
        let currVal = tree!.val
        if val < currVal {
            if tree!.left == nil {
                tree!.lesser += 1
                tree!.left = TreeNode(val)
                arr.append(lesser)
            } else {
                insert(&tree!.left, val, lesser, &arr)
            }
        } else { // val >= currVal
            if tree!.right == nil {
                if val > currVal {
                    tree!.right = TreeNode(val, tree!.lesser + 1)
                    arr.append(tree!.lesser + 1)
                } else {
                    tree!.right = TreeNode(val, lesser)
                    arr.append(lesser)
                }
            } else {
                insert(&tree!.right, val, lesser + 1, &arr)
            }
        }
    }
}


let nums = [2,0,1]//[5,2,6,1]//[-1, -1]
let result = countSmallerFast(nums)
print(result)
