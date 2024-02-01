//
//  Karger.swift
//  Tests
//
//  Created by Kevin Littles on 21/01/24.
//

import Foundation

typealias Graph = [Int: [Int]]

struct Karger {
    
    private typealias Edge = (Int, Int)
    
    static func minCut(of graph: Graph, in attempts: Int) -> Int {
        var minCut: Int = .max
        
        for _ in 0..<attempts {
            var workingGraph: Graph = graph
            
            while !isFullyContracted(workingGraph) {
                let edge: Edge = randomEdge(of: workingGraph)
                contract(edge: edge, from: &workingGraph)
            }
            
            minCut = min(minCut, currentCutSize(workingGraph))
        }
        
        return minCut
    }
    
    private static func contract(edge: Edge, from graph: inout Graph) {
        guard let secondVertexAdjacencies: [Int] = graph[edge.1] else { return }

        for vertex in secondVertexAdjacencies {
            if vertex != edge.0 {
                graph[vertex]?.removeAll(where: { $0 == edge.1 })
                graph[vertex]?.append(edge.0)
            }
        }

        graph.removeValue(forKey: edge.1)
        graph[edge.0]?.append(contentsOf: secondVertexAdjacencies)
        graph[edge.0]?.removeAll(where: { $0 == edge.0 })
    }
    
    private static func randomEdge(of graph: Graph) -> Edge {
        let vertex: Int = graph.randomElement()?.key ?? 0
        
        return (
            vertex,
            graph[vertex]?.randomElement() ?? vertex
        )
    }
    
    private static func isFullyContracted(_ graph: Graph) -> Bool {
        return graph.count == 2
    }

    private static func currentCutSize(_ graph: Graph) -> Int {
        return graph[graph.keys.first ?? 0]?.count ?? 0
    }
    
}
