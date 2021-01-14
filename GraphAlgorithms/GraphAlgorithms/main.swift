//
//  main.swift
//  GraphAlgorithms
//
//  Created by Behzad Dogahe on 1/9/21.
//

import Foundation

// Undirected Graph
public class Digraph: CustomStringConvertible {
    final var V: Int
    var E: Int
    var adj: [Set<Int>] = []
    private var indegree: [Int]
    
    public init(_ textFileUrlString: String) {
        V = 0
        E = 0
        indegree = []
        
        if let data = try? String(contentsOf: URL(string: textFileUrlString)!) {
            let input = data.components(separatedBy: .newlines)
            print(input)
            let vStr = input[0]
            if let v = Int(vStr) {
                V = v
                adj = Array(repeating: [], count: V)
                indegree = Array(repeating: 0, count: V)
            }
            let eStr = input[1]
            if let e = Int(eStr) {
                E = e
            }
            for i in 0 ..< E {
                let vw = input[i + 2].split(separator: " ")
                let vStr = vw[0]
                let wStr = vw[1]
                if let v = Int(vStr), let w = Int(wStr) {
                    addEdge(v, w);
                }
            }
        }
    }
    
    func addEdge(_ v: Int, _ w: Int) {
        print("Add Edge (\(v), \(w))")
        adj[v].insert(w)
        indegree[w] += 1
    }
    
    public var description: String {
        var str: String = ""
        str.append("\(V) vertices, \(E) edges \n");
        for v in 0 ..< V {
            str.append("\(v): ")
            for w in adj[v] {
                str.append("\(w) ")
            }
            str.append("\n")
        }
        return str
    }
}
// Undirected Graph
public class Graph: CustomStringConvertible {
    
    final var V: Int
    var E: Int
    var adj: [Set<Int>] = []
    
    public init(_ textFileUrlString: String, isDirected: Bool = false) {
        V = 0
        E = 0
        
        if let data = try? String(contentsOf: URL(string: textFileUrlString)!) {
            let input = data.components(separatedBy: .newlines)
            print(input)
            let vStr = input[0]
            if let v = Int(vStr) {
                V = v
                adj = Array(repeating: [], count: V)
            }
            let eStr = input[1]
            if let e = Int(eStr) {
                E = e
            }
            for i in 0 ..< E {
                let vw = input[i + 2].split(separator: " ")
                let vStr = vw[0]
                let wStr = vw[1]
                if let v = Int(vStr), let w = Int(wStr) {
                    addEdge(v, w, isDirected);
                }
                
            }
        }
    }
    
    func addEdge(_ v: Int, _ w: Int, _ isDirected: Bool) {
        print("Add Edge (\(v), \(w))")
        adj[v].insert(w)
        if  !isDirected {
            adj[w].insert(v)
        }
    }
    
    public var description: String {
        var str: String = ""
        str.append("\(V) vertices, \(E) edges \n");
        for v in 0 ..< V {
            str.append("\(v): ")
            for w in adj[v] {
                str.append("\(w) ")
            }
            str.append("\n")
        }
        return str
    }
    // TODO: Implement BFS https://algs4.cs.princeton.edu/41graph/BreadthFirstPaths.java.html
    
}

// BFS on Undirected Graph
public class BreadthFirstPaths {
    private var INFINITY: Int = Int.max
    private var marked: [Bool]  // marked[v] = is there an s-v path
    private var edgeTo: [Int]      // edgeTo[v] = previous edge on shortest s-v path
    private var distTo: [Int]      // distTo[v] = number of edges shortest s-v path
    private var parent: [Int?]
    
    public init(_ g: Graph, _ s: Int) {
        marked = Array(repeating: false, count: g.V)
        distTo = Array(repeating: 0, count: g.V)
        edgeTo = Array(repeating: 0, count: g.V)
        parent = Array(repeating: nil, count: g.V)
        bfs(g, s)
    }
    
    private func bfs(_ g: Graph, _ s: Int) {
        var q: [Int] = []
        for v in 0 ..< g.V {
            distTo[v] = INFINITY
        }
        distTo[s] = 0
        marked[s] = true
        parent[s] = nil
        q.append(s)
        while !q.isEmpty {
            let v = q.removeFirst()
            for w in g.adj[v] {
                if !marked[w] {
                    edgeTo[w] = v
                    distTo[w] = distTo[v] + 1
                    parent[w] = v
                    marked[w] = true
                    q.append(w)
                }
            }
            
        }
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    func distTo(_ v: Int) -> Int {
        return distTo[v]
    }
    
    func parent(_ v: Int) -> Int? {
        return parent[v]
    }
    
    func pathTo(_ v: Int) -> [Int]? {
        if !hasPathTo(v) {
            return nil
        }
        var path: [Int] = []
        var x: Int = v
        while distTo(x) != 0 {
            path.append(x)
            x = edgeTo[x]
        }
        path.append(x)
        return path
    }
}

public class DepthFirstSearch {
    private var marked: [Bool]    // marked[v] = is there an s-v path?
    var count: Int = 0
    
    public init(_ g: Graph, _ s: Int) {
        marked = Array(repeating: false, count: g.V)
        dfs(g, s)
    }
    
    func dfs(_ g: Graph, _ v: Int) {
        print("DFS for v = \(v)")
        count += 1
        marked[v] = true
        for w in g.adj[v] {
            if !marked(w) {
                dfs(g, w)
            }
        }
    }
    
    func marked(_ v: Int) -> Bool {
        return marked[v]
    }
}

public class DepthFirstPaths {
    private var marked: [Bool]  // marked[v] = is there an s-v path
    private var edgeTo: [Int]   // edgeTo[v] = last edge on s-v path
    private var s: Int
    
    public init(_ g: Graph, _ s: Int) {
        self.s = s
        edgeTo = Array(repeating: 0, count: g.V)
        marked = Array(repeating: false, count: g.V)
        dfs(g, s)
    }
    
    func dfs(_ g: Graph, _ v: Int) {
        marked[v] = true
        for w in g.adj[v] {
            if !marked[w] {
                edgeTo[w] = v
                dfs(g, w)
            }
        }
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    func pathTo(_ v: Int) -> [Int]? {
        if !hasPathTo(v) {
            return nil
        }
        var path: [Int] = []
        var x: Int = v
        while x != s {
            path.append(x)
            x = edgeTo[x]
        }
        path.append(x)
        return path
    }
}



let g  = Graph("https://algs4.cs.princeton.edu/42digraph/mediumDG.txt", isDirected: true)
    // Graph("http://dogahe.com/graph22p2a.txt", isDirected: true)
    // Graph("https://algs4.cs.princeton.edu/42digraph/tinyDG.txt", isDirected: true)
    //Graph("http://dogahe.com/graph.txt")
    //Graph("https://algs4.cs.princeton.edu/41graph/mediumG.txt")
    //Graph("http://dogahe.com/graph22p2a.txt")
    //Graph("http://dogahe.com/graph.txt")
    //Graph("https://algs4.cs.princeton.edu/41graph/tinyCG.txt")
print(g)

let s: Int = 2
let bfs: BreadthFirstPaths = BreadthFirstPaths(g, s)

for v in 0 ..< g.V {
    if bfs.hasPathTo(v) {
        var str: String = ""
        str = "\(s) to \(v) (\(bfs.distTo(v))): "
        if let p = bfs.pathTo(v) {
            var paths = p
            while !paths.isEmpty {
                let x = paths.removeLast()
                if x == s {
                    str += "\(x)"
                } else {
                    str += "-\(x)"
                }
            }
            print(str)
        }
    } else {
        print("\(s) to \(v) (-):  not connected")
    }
}

for v in 0 ..< g.V {
    if let p = bfs.parent(v) {
        print("Parent of node \(v) is \(p)")
    } else {
        print("Parent of node \(v) is nil")
    }
}

print("==================")
print("Depth First Search")
print("==================")
let g2  = Graph("https://algs4.cs.princeton.edu/42digraph/tinyDG.txt", isDirected: true)
print(g2)
let s2: Int = 3
let dfSearch = DepthFirstSearch(g2, s2)
for v in 0 ..< g2.V {
    if dfSearch.marked(v) {
        print("\(v)")
    }
}

if dfSearch.count != g2.V {
    print("Not connected")
} else {
    print("connected")
}


print("==================")
print("Depth First Path")
print("==================")

let dfsPath: DepthFirstPaths = DepthFirstPaths(g2, s2)

for v in 0 ..< g2.V {
    if dfsPath.hasPathTo(v) {
        var str: String = ""
        str = "\(s2) to \(v): "
        if let p = dfsPath.pathTo(v) {
            //print("v = \(v), path: \(p)")
            var paths = p
            while !paths.isEmpty {
                let x = paths.removeLast()
                if x == s2 {
                    str += "\(x)"
                } else {
                    str += "-\(x)"
                }
            }
            print(str)
        }
    } else {
        print("\(s2) to \(v):  not connected")
    }
}

