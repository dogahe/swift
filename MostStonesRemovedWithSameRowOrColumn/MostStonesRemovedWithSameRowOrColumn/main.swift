//
//  main.swift
//  MostStonesRemovedWithSameRowOrColumn
//
//  Created by Behzad Dogahe on 8/21/21.

/*
 
 tags:Google
 
 947. Most Stones Removed with Same Row or Column
 
 On a 2D plane, we place n stones at some integer coordinate points. Each coordinate point may have at most one stone.

 A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.

 Given an array stones of length n where stones[i] = [xi, yi] represents the location of the ith stone, return the largest possible number of stones that can be removed.

 Example 1:
 Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
 Output: 5
 Explanation: One way to remove 5 stones is as follows:
 1. Remove stone [2,2] because it shares the same row as [2,1].
 2. Remove stone [2,1] because it shares the same column as [0,1].
 3. Remove stone [1,2] because it shares the same row as [1,0].
 4. Remove stone [1,0] because it shares the same column as [0,0].
 5. Remove stone [0,1] because it shares the same row as [0,0].
 Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.
 
 Example 2:
 Input: stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
 Output: 3
 Explanation: One way to make 3 moves is as follows:
 1. Remove stone [2,2] because it shares the same row as [2,0].
 2. Remove stone [2,0] because it shares the same column as [0,0].
 3. Remove stone [0,2] because it shares the same row as [0,0].
 Stones [0,0] and [1,1] cannot be removed since they do not share a row/column with another stone still on the plane.
 
 Example 3:
 Input: stones = [[0,0]]
 Output: 0
 Explanation: [0,0] is the only stone on the plane, so you cannot remove it.
  
 Constraints:
 1 <= stones.length <= 1000
 0 <= xi, yi <= 104
 No two stones are at the same coordinate point.
 */

import Foundation

func removeStones(_ stones: [[Int]]) -> Int {
    var adj: [[Int]] = []
    for i in 0 ..< stones.count {
        var ad: [Int] = []
        for j in 0 ..< stones.count {
            if i != j {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    ad.append(j)
                }
            }
        }
        adj.append(ad)
    }
    let ncc = numConnectedComponents(adj)
    return stones.count - ncc
}



// Solution One: Finding all Connected Components
/*
func numConnectedComponents(_ adj: [[Int]]) -> Int {
    let n = adj.count
    var visited: [Int] = Array(repeating: 0, count: n)
    var ccc: [[Int]] = []
    for i in 0 ..< n {
        if visited[i] == 0 {
            dfs(adj, i, &visited, true, &ccc)
        }
    }
    print(ccc)
    return ccc.count
}

func dfs(_ adj: [[Int]], _ v: Int, _ visited: inout [Int], _ addingComponent: Bool, _ ccc: inout [[Int]]) {
    if addingComponent {
        ccc.append([v])
    }
    visited[v] = 1
    for a in adj[v] {
        if visited[a] == 0 {
            ccc[ccc.count - 1].append(a)
            dfs(adj, a, &visited, false, &ccc)
        }
    }
    visited[v] = 2
}
*/

// Solution Two: Just Number of Connected Components

func numConnectedComponents(_ adj: [[Int]]) -> Int {
    let n = adj.count
    var visited: [Int] = Array(repeating: 0, count: n)
    var numberOfComponents = 0
    for i in 0 ..< n {
        if visited[i] == 0 {
            dfs(adj, i, &visited)
            numberOfComponents += 1
        }
    }
    return numberOfComponents
}

func dfs(_ adj: [[Int]], _ v: Int, _ visited: inout [Int]) {
    if visited[v] == 2 {
        return
    }
    visited[v] = 1
    for a in adj[v] {
        if visited[a] == 0 {
            dfs(adj, a, &visited)
        }
    }
    visited[v] = 2
}

let stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
let c = removeStones(stones)
print(c)

let stones2 = [[0,0],[0,2],[1,1],[2,0],[2,2]]
let c2 = removeStones(stones2)
print(c2)
