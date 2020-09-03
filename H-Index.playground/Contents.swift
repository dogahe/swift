/*
 H-Index
 
 Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

 According to the definition of h-index on Wikipedia: "A scientist has index h if h of his/her N papers have at least h citations each, and the other N − h papers have no more than h citations each."

 Example:
 
 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had
              received 3, 0, 6, 1, 5 citations respectively.
              Since the researcher has 3 papers with at least 3 citations each and the remaining
              two with no more than 3 citations each, her h-index is 3.
 
 Note: If there are several possible values for h, the maximum one is taken as the h-index.
 
 */
import Foundation

func hIndex(_ citations: [Int]) -> Int {
    if citations.isEmpty {
        return 0
    }
    let sortedCitations = citations.sorted()
    
    if sortedCitations.last == 0 {
        return 0
    }
    let length: Int = sortedCitations.count
    
    var hIndex: Int = length
    var index: Int = 0
    while hIndex > sortedCitations[index] && index < length {
        index += 1
        hIndex -= 1
    }
    return hIndex
}

//let citations = [3,0,6,1,5]
//let citations = [8, 8,8, 8]
let citations = [3, 4, 5, 2, 2]
hIndex(citations)

