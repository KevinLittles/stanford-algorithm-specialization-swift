//
//  BellmanFord.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct BellmanFord {
    
    static func potentials(from graph: WeightedGraph, source: Int) -> [Int: Int]? {
        var distances = initializeDistances(for: graph, source: source)
        let edges = extractEdges(from: graph)

        relaxEdges(repeat: graph.keys.count - 1, distances: &distances, edges: edges)
        
        return hasNegativeCycle(in: distances, edges: edges) ? nil : distances
    }

    private static func initializeDistances(for graph: WeightedGraph, source: Int) -> [Int: Int] {
        var distances: [Int: Int] = [:]
        for vertex in graph.keys {
            distances[vertex] = (vertex == source) ? 0 : Int.max
        }
        return distances
    }

    private static func extractEdges(from graph: WeightedGraph) -> [(from: Int, to: Int, weight: Int)] {
        var edges: [(Int, Int, Int)] = []
        for (u, adjacents) in graph {
            for edge in adjacents {
                edges.append((u, edge.vertex, edge.distance))
            }
        }
        return edges
    }

    private static func relaxEdges(repeat times: Int, distances: inout [Int: Int], edges: [(Int, Int, Int)]) {
        for _ in 1...times {
            for (u, v, weight) in edges {
                guard let distanceU = distances[u], distanceU != Int.max else { continue }
                let updatedDistance = distanceU + weight
                if updatedDistance < distances[v, default: Int.max] {
                    distances[v] = updatedDistance
                }
            }
        }
    }

    private static func hasNegativeCycle(in distances: [Int: Int], edges: [(Int, Int, Int)]) -> Bool {
        for (u, v, weight) in edges {
            guard let distanceU = distances[u], distanceU != Int.max else { continue }
            if distanceU + weight < distances[v, default: Int.max] {
                return true
            }
        }
        return false
    }
    
}
