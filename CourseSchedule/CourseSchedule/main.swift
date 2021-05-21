//
//  main.swift
//  CourseSchedule
//
//  Created by Behzad Dogahe on 5/18/21.
//

/*
 207. Course Schedule
 
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return true if you can finish all courses. Otherwise, return false.

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0. So it is possible.
 Example 2:

 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
 To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
  
 Constraints:

 1 <= numCourses <= 105
 0 <= prerequisites.length <= 5000
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 All the pairs prerequisites[i] are unique.
 
 */
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var adj: [[Int]] = Array(repeating: [], count: numCourses)
    for pre in prerequisites {
        adj[pre[1]].append(pre[0])
    }
    var visited: [Int] = Array(repeating: 0, count: numCourses)
    for i in 0 ..< numCourses {
        if visited[i] == 0 && !dfs(adj, &visited, i) {
            return false
        }
    }
    return true
}

func dfs(_ adj: [[Int]], _ visited: inout [Int], _ v: Int) -> Bool {
    if visited[v] == 1 {
        return false
    } else if visited[v] == 2 {
        return true
    }
    visited[v] = 1
    for ad in adj[v] {
        if !dfs(adj, &visited, ad) {
            return false
        }
    }
    visited[v] = 2
    return true
}

let numCourses = 4
let prerequisites = [[1,0], [3, 1], [2, 1], [0, 3]]
print(canFinish(numCourses, prerequisites))

