//
//  main.swift
//  CTCI_4_2
//
//  Created by Behzad Dogahe on 5/23/21.
//

/*
 
4.2 Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
*/

import Foundation

func isThereARoute(_ adj: [[Int]], _ a: Int, _ b: Int) -> Bool {
    var visited: [Int] = Array(repeating: 0, count: adj.count)
    var connected: Bool = false
    dfs(adj, &visited, a, b, &connected)
    return connected
}

func dfs(_ adj: [[Int]], _ visited: inout [Int], _ a: Int, _ b: Int, _ connected: inout Bool) {
    if connected == true {
        return
    }
    if visited[a] == 2 {
        return
    }
    visited[a] = 1
    for v in adj[a] {
        if v == b {
            connected = true
        }
        if visited[v] == 0 {
            dfs(adj, &visited, v, b, &connected)
        }
    }
    visited[a] = 2
}
let adj = [[1], [2], [3], [1], [0]]


print(isThereARoute(adj, 1, 0))
