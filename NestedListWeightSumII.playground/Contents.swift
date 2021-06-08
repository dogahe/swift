/*
 
 364 Nested List Weight Sum II
 
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.

 Different from the previous question where weight is increasing from root to leaf, now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.

 Example 1:

 Input: [[1,1],2,[1,1]]
 Output: 8
 Explanation: Four 1's at depth 1, one 2 at depth 2.
 Example 2:

 Input: [1,[4,[6]]]
 Output: 17
 Explanation: One 1 at depth 3, one 4 at depth 2, and one 6 at depth 1; 1*3 + 4*2 + 6*1 = 17.
 */

func weightSum(_ list: [Any]) -> Int {
    var levelLists: [[Int]] = []
    helper(list, 0, &levelLists)
    print(levelLists)
    var sum = 0
    for i in 0 ..< levelLists.count {
        let list = levelLists[i]
        for element in list {
            sum += (levelLists.count - i)*element
        }
    }
    return sum
}

func helper(_ list: [Any], _ level: Int, _ levelLists: inout [[Int]]) {
    for element in list {
        if let num = element as? Int {
            if levelLists.count == level {
                print("O \(num)")
                levelLists.append([num])
            } else {
                while level >= levelLists.count {
                    levelLists.append([])
                }
                print("X \(num), \(level), \(levelLists)")
                levelLists[level].append(num)
            }
        } else if let newList = element as? [Any] {
            helper(newList, level + 1, &levelLists)
        }
    }
}

let list: [Any] = [1,[4,[6]]] // [[1,1],2,[1,1]] // [1,[4,[6]]]
weightSum(list)

