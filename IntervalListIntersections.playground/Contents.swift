/*
 
 tags:Facebook
 
 986. Interval List Intersections

 You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti, endi] and secondList[j] = [startj, endj]. Each list of intervals is pairwise disjoint and in sorted order.

 Return the intersection of these two interval lists.

 A closed interval [a, b] (with a < b) denotes the set of real numbers x with a <= x <= b.

 The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval. For example, the intersection of [1, 3] and [2, 4] is [2, 3].

 Example 1:
 Input: firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
 Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 
 Example 2:
 Input: firstList = [[1,3],[5,9]], secondList = []
 Output: []
 
 Example 3:
 Input: firstList = [], secondList = [[4,8],[10,12]]
 Output: []
 
 Example 4:
 Input: firstList = [[1,7]], secondList = [[3,10]]
 Output: [[3,7]]
  
 Constraints:
 0 <= firstList.length, secondList.length <= 1000
 firstList.length + secondList.length >= 1
 0 <= starti < endi <= 109
 endi < starti+1
 0 <= startj < endj <= 109
 endj < startj+1
 
 */
func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    var i = 0, j = 0
    var output: [[Int]] = []
    while i < firstList.count && j < secondList.count {
        let s1 = firstList[i][0]
        let e1 = firstList[i][1]
        let s2 = secondList[j][0]
        let e2 = secondList[j][1]
        
        if let intersection = getIntersection(s1, e1, s2, e2) {
            output.append(intersection)
        }
        if e1 >= e2 {
            j += 1
        } else {
            i += 1
        }
    }
    return output
}

func getIntersection(_ s1: Int, _ e1: Int, _ s2: Int, _ e2: Int) -> [Int]? {
    if e1 >= s2 && e2 >= s1 {
        return [max(s1, s2), min(e1, e2)]
    }
    return nil
}

let firstList = [[4,6],[7,8],[10,17]]//[[5, 10]]//[[1, 7]]//[[1, 3], [5, 9]]//[[0,2],[5,10],[13,23],[24,25]]
let secondList: [[Int]] = [[5, 10]] //[[3, 10]]//[]//[[1,5],[8,12],[15,24],[25,26]]

intervalIntersection(firstList, secondList)
