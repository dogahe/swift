//
//  main.swift
//  MinimumSpanningTree
//
//  Created by Behzad Dogahe on 2/4/21.
//

import Foundation

struct Edge: Hashable, CustomStringConvertible {
    
    
    /*
    public static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight <= rhs.weight
    }
    
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.v == rhs.v && lhs.w == rhs.w && lhs.w == rhs.w
    }
    */
    var v: Int
    var w: Int
    var weight: Double
    
    var description: String {
        return "\(v)-\(w)" + String(format: " %.5f", weight)
    }
}

public class EdgeWeightedGraph: CustomStringConvertible {
    final var V: Int
    var E: Int
    var adj: [Set<Edge>] = []
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

public class KruskalMST {
    
}

let g  = EdgeWeightedGraph("https://algs4.cs.princeton.edu/43mst/tinyEWG.txt")
print(g)


