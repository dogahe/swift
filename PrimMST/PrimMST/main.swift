//
//  main.swift
//  PrimMST
//
//  Created by Behzad Dogahe on 2/12/21.
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

public class IndexMinPQ {
    private var pq: [Int]
    private var qp: [Int]
    var n: Int
    var keys: [Int] = []
    var maxN: Int
    
    init(_ maxN: Int) {
        self.maxN = maxN
        n = 0
        keys = Array(repeating: 0, count: maxN)
        pq = Array(repeating: 0, count: maxN)
        qp = Array(repeating: -1, count: maxN)
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
    
    func minIndex() -> Int {
        return keys[pq[0]]
    }
    
    func minKey() -> Int {
        return pq[0]
    }
    
    func extractMin() -> Int {
        let min = pq[0]
        exch(0, n)
        n = n - 1
        
""
        
        qp[min] = -1
        pq[n + 1] = -1
        return min
    }
    
    func sink(_ k: Int) {
        while 2*k < n {
            
        }
    }
    
    
    private void sink(int k) {
           while (2*k <= n) {
               int j = 2*k;
               if (j < n && greater(j, j+1)) j++;
               if (!greater(k, j)) break;
               exch(k, j);
               k = j;
           }
       }
    
    
    func insert(_ i: Int, _ key: Int) {
        if !contains(i) {
            n = n + 1
            qp[i] = n
            pq[n] = i
            keys[i] = key
            var k = n
            while k > 0 && pq[(k - 1)/2] > pq[k] {
                exch((k - 1)/2, k)
                k = (k - 1)/2
            }
        }
    }
    
    func exch(_ i: Int, _ j: Int) {
        let swap = pq[i]
        pq[i] = pq[j]
        pq[j] = swap
        qp[pq[i]] = i
        qp[pq[j]] = j
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
    
    func contains(_ i: Int) -> Bool {
        return qp[i] != -1
    }
}

public class PrimMST {
    
    var edgeTo: [Edge] = []   // edgeTo[v] = shortest edge from tree vertex to non-tree vertex
    var distTo: [Double] = [] // distTo[v] = weight of shortest such edge
    var marked: [Bool] = []   // marked[v] = true if v on tree, false otherwise
    
    init(_ g: EdgeWeightedGraph) {
        marked = Array(repeating: false, count: g.V)
        distTo = Array(repeating: Double.greatestFiniteMagnitude, count: g.V)
        for v in 0 ..< g.V {
            if !marked[v] {
                
            }
        }
    }
    
    func prim(_ g: EdgeWeightedGraph, _ s: Int) {
        distTo[s] = 0
        
    }
    
}


let g  = EdgeWeightedGraph(["9", "14", "0 1 4", "1 2 8", "2 3 7", "3 4 9", "4 5 10", "5 6 2", "6 7 1", "7 0 8", "3 5 14", "2 5 4", "6 8 8", "7 8 7", "7 1 11", "8 2 2"])
print(g)
let mst: PrimMST = PrimMST(g)
