//
//  main.swift
//  NumberOfConnectedComponentsInAnUndirectedGraph
//
//  Created by Behzad Dogahe on 5/20/21.
//
/*
 323. Number of Connected Components in an Undirected Graph
 
 Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to find the number of connected components in an undirected graph.

 Example 1:
      0          3
      |          |
      1 --- 2    4
 Given n = 5 and edges = [[0, 1], [1, 2], [3, 4]], return 2.

 Example 2:
      0           4
      |           |
      1 --- 2 --- 3
 Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [3, 4]], return 1.

 Note:
 You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
 */

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

var adj = [[1], [0, 2], [1], [4], [3]]//[[2, 4], [5], [0, 4], [], [2], [1]]

let num = numConnectedComponents(adj)
print(num)
