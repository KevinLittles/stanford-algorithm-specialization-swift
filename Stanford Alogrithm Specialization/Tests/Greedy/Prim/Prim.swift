//
//  Prim.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import Foundation

struct Prim {
    
    static func calculateMinimumSpanningTreeCost(edges: [WheightedEdge], startVertex: Int) -> Int {
        return minimumSpanningTree(edges: edges, startVertex: startVertex).reduce(0) { $0 + $1.cost }
    }

    private static func minimumSpanningTree(edges: [WheightedEdge], startVertex: Int) -> [WheightedEdge] {
        var mstEdges = [WheightedEdge]()
        var verticesInMST = Set<Int>()
        let edgeHeap = MinHeap<WheightedEdge>()
        var graph = WeightedGraph()

        for edge in edges {
            graph[edge.vertices.0, default: []].append((vertex: edge.vertices.1, distance: edge.cost))
            graph[edge.vertices.1, default: []].append((vertex: edge.vertices.0, distance: edge.cost))
        }

        verticesInMST.insert(startVertex)
        for edge in graph[startVertex] ?? [] {
            edgeHeap.insert(WheightedEdge(vertices: (startVertex, edge.vertex), cost: edge.distance))
        }

        while let currentEdge = edgeHeap.extract() {
            let currentVertex = currentEdge.vertices.1

            if verticesInMST.contains(currentVertex) {
                continue
            }

            verticesInMST.insert(currentVertex)
            mstEdges.append(currentEdge)

            for edge in graph[currentVertex] ?? [] {
                if !verticesInMST.contains(edge.vertex) {
                    edgeHeap.insert(WheightedEdge(vertices: (currentVertex, edge.vertex), cost: edge.distance))
                }
            }
        }

        return mstEdges
    }

}
