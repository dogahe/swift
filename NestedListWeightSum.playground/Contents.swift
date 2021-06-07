/*
 339    Nested List Weight Sum
 
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.

 Example 1:
 Input: [[1,1],2,[1,1]]
 Output: 10
 Explanation: Four 1's at depth 2, one 2 at depth 1.
 
 Example 2:
 Input: [1,[4,[6]]]
 Output: 27
 Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27.
 
 */

func weightSum(_ list: [Any]) -> Int {
    return helper(list, 1)
}

func helper(_ list: [Any], _ depth: Int) -> Int {
    var sum = 0
    for element in list {
        if let num = element as? Int {
            sum += depth * num
        } else if let newList = element as? [Any] {
            sum += helper(newList, depth + 1)
        }
    }
    return sum
}

let list: [Any] = [1,[4,[6]]]//[[1,1],2,[1,1]]
weightSum(list)
