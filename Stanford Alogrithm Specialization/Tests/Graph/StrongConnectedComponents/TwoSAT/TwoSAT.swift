//
//  TwoSAT.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

struct TwoSAT {
    
    static func isSatisfiable(from clauses: [(Int, Int)]) -> Bool {
        let implicationGraph = buildImplicationGraph(from: clauses)
        let sccs = Kosaraju.strongConnectedComponents(implicationGraph)
        let variableToSCC = buildSCCMap(from: sccs)
        
        for variable in variableToSCC.keys {
            if variableToSCC[variable] == variableToSCC[-variable] {
                return false
            }
        }
        return true
    }

    // MARK: - Private

    private static func buildImplicationGraph(from clauses: [(Int, Int)]) -> Graph {
        var graph: Graph = [:]
        
        for (a, b) in clauses {
            graph[-a, default: []].append(b)
            graph[-b, default: []].append(a)
        }
        
        return graph
    }

    private static func buildSCCMap(from sccs: [[Int]]) -> [Int: Int] {
        var map: [Int: Int] = [:]
        for (i, scc) in sccs.enumerated() {
            for literal in scc {
                map[literal] = i
            }
        }
        return map
    }
}
