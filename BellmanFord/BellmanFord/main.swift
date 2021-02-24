//
//  main.swift
//  BellmanFord
//
//  Created by Behzad Dogahe on 2/21/21.
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

public class EdgeWeightedDigraph: CustomStringConvertible {
    final var V: Int
    var E: Int
    var adj: [Set<Edge>] = []
    
    //  Initializes an empty edge-weighted digraph with v vertices and 0 edges.
    public init(_ v: Int) {
        V = v
        E = 0
        adj = Array(repeating: [], count: V)
    }
    
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

public class BellmanFord {
    private var epsilon: Double = 1E-14
    private var edgeTo: [Edge?] = []      // edgeTo[v] = last edge on shortest s->v path
    private var distTo: [Double]    // distTo[v] = distance  of shortest s->v path
    private var onQueue: [Bool]     // onQueue[v] = is v currently on the queue?
    private var queue: [Int]        // queue of vertices to relax
    private var cycle: [Edge]? = nil      // negative cycle (or null if no such cycle)
    private var cost: Int = 0
    
    public init(_ g: EdgeWeightedDigraph, _ s: Int) {
        distTo = Array(repeating: Double.infinity, count: g.V)
        edgeTo = Array(repeating: nil, count: g.V)
        onQueue = Array(repeating: false, count: g.V)
        distTo[s] = 0.0
        
        // Bellman-Ford algorithm
        queue = []
        queue.append(s)
        onQueue[s] = true
        while !queue.isEmpty && !hasNegativeCycle() {
            let v = queue.removeFirst()
            onQueue[v] = false
            relax(g, v)
        }
    }
    
    func relax(_ g: EdgeWeightedDigraph, _ v: Int) {
        for e in g.adj[v] {
            let w = e.to()
            if distTo[w] > distTo[v] + e.weight + epsilon {
                distTo[w] = distTo[v] + e.weight
                edgeTo[w] = e
                if !onQueue[w] {
                    queue.append(w)
                    onQueue[w] = true
                }
            }
            cost += 1
            if cost % g.V == 0 {
                findNegativeCycle()
                if hasNegativeCycle() {
                    return
                }
            }
        }
    }
    
    func hasNegativeCycle() -> Bool {
        return cycle != nil
    }
    
    func findNegativeCycle() {
        let V = edgeTo.count
        let spt: EdgeWeightedDigraph = EdgeWeightedDigraph(V)
        for v in 0 ..< V {
            if let edge = edgeTo[v] {
                spt.addEdge(edge)
            }
        }
        // FIX: TODO: Add Later
        // EdgeWeightedDirectedCycle finder = new EdgeWeightedDirectedCycle(spt);
        // cycle = finder.cycle();
        cycle = nil
        
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
        while e != nil {
            path.insert(e!, at: 0)
            e = edgeTo[e!.from()]
        }
        return path
    }
}

    

let g  = EdgeWeightedDigraph("https://algs4.cs.princeton.edu/44sp/tinyEWDn.txt")
print(g)
let s: Int = 0
let sp: BellmanFord = BellmanFord(g, s)

if sp.hasNegativeCycle() {
    
} else {
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

}
