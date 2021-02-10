//
//  main.swift
//  MinimumSpanningTree
//
//  Created by Behzad Dogahe on 2/4/21.
//

import Foundation

struct Edge: Hashable, CustomStringConvertible, Comparable {
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
    var v: Int
    var w: Int
    var weight: Double
    
    func other(_ vertex: Int) -> Int {
        if vertex == v {
            return w
        } else {
            return v
        }
    }
    
    var description: String {
        return "\(v)-\(w)" + String(format: " %.5f", weight)
    }
}

public class EdgeWeightedGraph: CustomStringConvertible {
    final var V: Int
    var E: Int
    var adj: [Set<Edge>] = []
    
    public init(_ edgeArray: [String], isDirected: Bool = false) {
        V = 0
        E = 0
        let vStr = edgeArray[0]
        if let v = Int(vStr) {
            V = v
            adj = Array(repeating: [], count: V)
        }
        let eStr = edgeArray[1]
        if let e = Int(eStr) {
            E = e
        }
        for i in 0 ..< E {
            let vw = edgeArray[i + 2].split(separator: " ")
            let vStr = vw[0]
            let wStr = vw[1]
            let weightStr = vw[2]
            if let v = Int(vStr), let w = Int(wStr), let weight = Double(weightStr) {
                let e = Edge(v: v, w: w, weight: weight)
                addEdge(e);
            }
        }
    }

    
    public init(_ textFileUrlString: String) {
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
                let weightStr = vw[2]
                if let v = Int(vStr), let w = Int(wStr), let weight = Double(weightStr) {
                    let e = Edge(v: v, w: w, weight: weight)
                    addEdge(e);
                }
            }
        }
    }
    
    func addEdge(_ e: Edge) {
        print("Add Edge \(e.v), \(e.w) - \(e.weight)")
        adj[e.v].insert(e)
        adj[e.w].insert(e)
    }
    
    var edges: Set<Edge> {
        var list: Set<Edge> = []
        for v in 0 ..< V {
            var selfLoops: Int = 0
            for e in adj[v] {
                if e.other(v) > v {
                    list.insert(e)
                } else if e.other(v) == v {
                    if selfLoops % 2 == 0 {
                        list.insert(e)
                    }
                    selfLoops += 1
                }
            }
        }
        return list
    }

    public var description: String {
        var str: String = ""
        str.append("\(V) vertices, \(E) edges \n");
        for v in 0 ..< V {
            str.append("\(v): ")
            for e in adj[v] {
                str.append("\(e) ")
            }
            str.append("\n")
        }
        return str
    }
}

public class MinPQ<T: Comparable> {
    private var pq: [T]
    var n: Int
    init(_ keys: [T]) {
        n = keys.count
        pq = keys
        for i in stride(from: Int(floor(Double(n)/2)) - 1, to: -1, by: -1) {
            minHeapify(i)
        }
    }
    
    func minHeapify(_ i: Int) {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var smallest: Int
        if l < n && pq[l] < pq[i] {
            smallest = l
        } else {
            smallest = i
        }
        if r < n && pq[r] < pq[smallest] {
            smallest = r
        }
        if smallest != i {
            let temp = pq[smallest]
            pq[smallest] = pq[i]
            pq[i] = temp
            minHeapify(smallest)
        }
    }
    
    func min() -> T {
        return pq[0]
    }
    
    func extractMin() -> T {
        let min = pq[0]
        pq[0] = pq[n - 1]
        n = n - 1
        minHeapify(0)
        return min
    }
    
    func insert(_ key: T) {
        n = n + 1
        pq.append(key) // dummy value just to increase the size of pq
        decreaseKey(n - 1, key)
    }
    
    func decreaseKey(_ i: Int, _ key: T) {
        var index = i
        if key > pq[index] {
            print("Error")
        } else {
            pq[index] = key
            while index > 0 && pq[(index - 1)/2] > pq[index] {
                let temp = pq[(index - 1)/2]
                pq[(index - 1)/2] = pq[index]
                pq[index] = temp
                index = (index - 1)/2
            }
        }
    }
    
    func queue() -> [T] {
        return Array(pq.prefix(n))
    }
    
    func isEmpty() -> Bool {
        return n == 0
    }
}

class UF {
    var parent: [Int] // parent[i] = parent of i
    var rank: [Int]   // rank[i] = rank of subtree rooted at i (never more than 31)
    var size: Int     // number of components
    
    init(_ n: Int) {
        size = n
        parent = Array(repeating: 0, count: n)
        rank = Array(repeating: 0, count: n)
        for i in 0 ..< n {
            parent[i] = i
        }
    }
    
    func findSet(_ p: Int) -> Int {
        var pCopy = p
        while pCopy != parent[pCopy] {
            parent[pCopy] = parent[parent[pCopy]]   // path compression by halving
            pCopy = parent[pCopy]
        }
        return pCopy
    }
    
    func union(_ p: Int, _ q: Int) {
        link(findSet(p), findSet(q))
    }
    
    func link(_ p: Int, _ q: Int) {
        if rank[p] > rank[q] {
            parent[q] = p
        } else {
            parent[p] = q
            if rank[p] == rank[q] {
                rank[q] = rank[q] + 1
            }
        }
        size -= 1
    }
}


public class KruskalMST {
    
    var weight: Double = 0 // weight of MST
    var mst: [Edge] = [] // edges in MST

    init(_ g: EdgeWeightedGraph) {
        let pq: MinPQ<Edge> = MinPQ([])
        for e in g.edges {
            pq.insert(e)
        }
        
        let uf = UF(g.V)
        while !pq.isEmpty() && mst.count < g.V - 1 {
            let e = pq.extractMin()
            let v = e.v
            let w = e.w
            if uf.findSet(v) != uf.findSet(w) {
                uf.union(v, w)
                mst.append(e)
                weight += e.weight
            }
        }
    }
    
    func edges() -> [Edge] {
        return mst
    }
    
}

// let g  = EdgeWeightedGraph("https://algs4.cs.princeton.edu/43mst/tinyEWG.txt")
// OR
let g  = EdgeWeightedGraph(["9", "14", "0 1 4", "1 2 8", "2 3 7", "3 4 9", "4 5 10", "5 6 2", "6 7 1", "7 0 8", "3 5 14", "2 5 4", "6 8 8", "7 8 7", "7 1 11", "8 2 2"])
print(g)
let mst: KruskalMST = KruskalMST(g)
for e in mst.edges() {
    print("\(e)")
}
print(String(format: "Weight %.5f\n", mst.weight))



