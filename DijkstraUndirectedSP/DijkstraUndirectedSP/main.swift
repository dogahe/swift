//
//  main.swift
//  DijkstraUndirectedSP
//
//  Created by Behzad Dogahe on 2/25/21.
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
    
    func from() -> Int {
        return v
    }
    
    func to() -> Int {
        return w
    }
    
    var description: String {
        return "\(v) -> \(w)" + String(format: "  %.5f", weight)
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

public class IndexMinPQ {
    private var pq: [Int]  // binary heap using 1-based indexing
    private var qp: [Int]   // inverse of pq - qp[pq[i]] = pq[qp[i]] = i
    var n: Int // number of elements on PQ
    var keys: [Double] = []
    var maxN: Int  // maximum number of elements on PQ
    
    init(_ maxN: Int) {
        self.maxN = maxN
        n = 0
        keys = Array(repeating: 0, count: maxN + 1)
        pq = Array(repeating: 0, count: maxN + 1)
        qp = Array(repeating: -1, count: maxN + 1)
    }
    
    func minIndex() -> Int {
        return pq[1]
    }
    
    func minKey() -> Double {
        return keys[pq[1]]
    }
    
    func greater(_ i: Int, _ j: Int) -> Bool {
        return keys[pq[i]] > keys[pq[j]]
    }
    
    func sink(_ kk: Int) {
        var k = kk
        while 2*k <= n {
            var j = 2*k
            if j < n && greater(j, j + 1) {
                j = j + 1
            }
            if !greater(k, j) {
                break
            }
            exch(k, j)
            k = j
        }
    }
    
    func insert(_ i: Int, _ key: Double) {
        if !contains(i) {
            n = n + 1
            qp[i] = n
            pq[n] = i
            keys[i] = key
            swim(n)
        }
    }
    
    func swim(_ kk: Int) {
        var k = kk
        while k > 1 && keys[pq[k/2]] > keys[pq[k]] {
            exch(k, k/2)
            k = k/2
        }
    }
    
    func exch(_ i: Int, _ j: Int) {
        let swap = pq[i]
        pq[i] = pq[j]
        pq[j] = swap
        qp[pq[i]] = i
        qp[pq[j]] = j
    }
    
    func delMin() -> Int? {
        if n != 0 {
            let min = pq[1]
            exch(1, n)
            n = n - 1
            sink(1)
            qp[min] = -1
            //keys[min] = nil
            pq[n + 1] = -1
            return min
        }
        return nil
    }
    
    func contains(_ i: Int) -> Bool {
        return qp[i] != -1
    }
    
    func decreaseKey(_ i: Int, _ key: Double) {
        if contains(i) {
            if keys[i] > key {
                keys[i] = key
                swim(qp[i])
            }
        }
    }
    
    func queue() -> [Int] {
        return Array(pq.prefix(n))
    }
    
    func isEmpty() -> Bool {
        return n == 0
    }
}

public class DijkstraSP {
    private var distTo: [Double]       // distTo[v] = distance  of shortest s->v path
    private var edgeTo: [Edge?] = []   // edgeTo[v] = last edge on shortest s->v path
    private var pq: IndexMinPQ         // priority queue of vertices
    
    public init(_ g: EdgeWeightedGraph, _ s: Int) {
        distTo = Array(repeating: Double.infinity, count: g.V)
        edgeTo = Array(repeating: nil, count: g.V)
        distTo[s] = 0.0
        
        // relax vertices in order of distance from s
        pq = IndexMinPQ(g.V)
        pq.insert(s, distTo[s])
        while !pq.isEmpty() {
            let v = pq.delMin()
            for e in g.adj[v!] {
                relax(e, v!)
            }
        }
    }
    
    // relax edge e and update pq if changed
    func relax(_ e: Edge, _ v: Int) {
        let w = e.other(v)
        if distTo[w] > distTo[v] + e.weight {
            distTo[w] = distTo[v] + e.weight
            edgeTo[w] = e;
            if pq.contains(w) {
                pq.decreaseKey(w, distTo[w]);
            } else {
                pq.insert(w, distTo[w])
            }
        }
    }
    
    func distTo(_ v: Int) -> Double {
        return distTo[v]
    }
    
    func hasPathTo(_ v: Int) -> Bool {
        return distTo[v] < Double.infinity
    }
    
    func pathTo(_ v: Int) -> [Edge]? {
        if !hasPathTo(v) {
            return nil
        }
        var path: [Edge] = []
        var e: Edge? = edgeTo[v]
        var x = v
        while e != nil {
            path.insert(e!, at: 0)
            x = e!.other(x)
            e = edgeTo[x]
        }
        return path
    }
    
}


//let g  = EdgeWeightedGraph("https://algs4.cs.princeton.edu/43mst/tinyEWG.txt")
let g  = EdgeWeightedGraph(["9", "14", "0 1 4", "1 2 8", "2 3 7", "3 4 9", "4 5 10", "5 6 2", "6 7 1", "7 0 8", "3 5 14", "2 5 4", "6 8 6", "7 8 7", "7 1 11", "8 2 2"])
print(g)
let s: Int = 0
let sp: DijkstraSP = DijkstraSP(g, s)

for v in 0 ..< g.V {
    if sp.hasPathTo(v) {
        var str: String = ""
        str = "\(s) to \(v) " + String(format: " %.5f", sp.distTo(v)) + "     "
        if let pathTo = sp.pathTo(v) {
            for e in pathTo {
                str += "\(e)   "
            }
        }
        print(str)
    } else {
        print("\(s) to \(v)         no path.")
    }
}


