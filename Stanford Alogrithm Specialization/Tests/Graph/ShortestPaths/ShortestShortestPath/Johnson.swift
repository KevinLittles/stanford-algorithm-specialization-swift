//
//  Johnson.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct Johnson {
    
    static func shortestShortestPath(in graph: WeightedGraph) -> Int? {
        let augmentedGraph = addFictitiousVertex(to: graph)
        guard let potentials = BellmanFord.potentials(from: augmentedGraph, source: 0) else {
            return nil
        }

        let reweighted = reweight(graph, using: potentials)
        return findShortestShortestPath(in: graph, reweighted: reweighted, potentials: potentials)
    }

    private static func addFictitiousVertex(to graph: WeightedGraph) -> WeightedGraph {
        var newGraph = graph
        let s = 0
        newGraph[s] = []
        for v in graph.keys {
            newGraph[s]?.append((vertex: v, distance: 0))
        }
        return newGraph
    }

    private static func reweight(_ graph: WeightedGraph, using potentials: [Int: Int]) -> WeightedGraph {
        var newGraph: WeightedGraph = [:]
        for (u, edges) in graph {
            for edge in edges {
                let wPrime = edge.distance + potentials[u]! - potentials[edge.vertex]!
                newGraph[u, default: []].append((vertex: edge.vertex, distance: wPrime))
            }
        }
        return newGraph
    }

    private static func findShortestShortestPath(in originalGraph: WeightedGraph, reweighted: WeightedGraph, potentials: [Int: Int]) -> Int? {
        var shortest = Int.max
        
        for source in originalGraph.keys {
            let distances = Dijkstra.shortestPaths(for: reweighted, from: source)
            let corrected = correctDistances(distances, from: source, using: potentials)
            shortest = min(shortest, corrected.values.filter { $0 != 0 }.min() ?? shortest)
        }

        return shortest == Int.max ? nil : shortest
    }

    private static func correctDistances(_ distances: [Int: Int], from source: Int, using potentials: [Int: Int]) -> [Int: Int] {
        var corrected: [Int: Int] = [:]
        for (v, dPrime) in distances {
            corrected[v] = dPrime - potentials[source]! + potentials[v]!
        }
        return corrected
    }
    
}
