//
//  Kruskal.swift
//
// Created by Kevin Littles on 04/03/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct Kruskal {
    
    private static func find(node: Int, parent: inout [Int]) -> Int {
        if parent[node] != node {
            parent[node] = find(node: parent[node], parent: &parent)
        }
        return parent[node]
    }

    private static func union(node1: Int, node2: Int, parent: inout [Int], rank: inout [Int]) -> Bool {
        let root1 = find(node: node1, parent: &parent)
        let root2 = find(node: node2, parent: &parent)

        if root1 == root2 {
            return false
        }

        if rank[root1] > rank[root2] {
            parent[root2] = root1
        } else if rank[root1] < rank[root2] {
            parent[root1] = root2
        } else {
            parent[root2] = root1
            rank[root1] += 1
        }

        return true
    }

}

// MARK: - Minimum Spannig Tree
extension Kruskal {
    
    static func minimumSpanningTree(edges: [WheightedEdge], numberOfVertices: Int) -> [WheightedEdge] {
        var mstEdges = [WheightedEdge]()
        var parent = Array(0...numberOfVertices)
        var rank = Array(repeating: 0, count: numberOfVertices + 1)
        let sortedEdges = edges.sorted()

        for edge in sortedEdges {
            if union(node1: edge.vertices.0, node2: edge.vertices.1, parent: &parent, rank: &rank) {
                mstEdges.append(edge)
            }
            if mstEdges.count == numberOfVertices - 1 {
                break
            }
        }

        return mstEdges
    }
    
    private static func removeLargestEdges(from mstEdges: [WheightedEdge], k: Int) -> [WheightedEdge] {
        let sortedMSTEdges = mstEdges.sorted(by: { $0.cost > $1.cost }) // Ordenar por custo decrescente
        return Array(sortedMSTEdges.dropFirst(k - 1)) // Remover as (k-1) arestas mais caras
    }

    private static func findMaxSpacing(from remainingEdges: [WheightedEdge]) -> Int {
        return remainingEdges.first?.cost ?? -1 // Retorna o custo da primeira aresta restante (max-spacing)
    }
    
}


//MARK: -  Max-Spacing K-Clustering
extension Kruskal {
    
    static func maxSpacingKClustering(edges: [WheightedEdge], numberOfVertices: Int, k: Int) -> Int {
        var parent = Array(0...numberOfVertices)
        var rank = Array(repeating: 0, count: numberOfVertices + 1)
        let sortedEdges = edges.sorted()
        
        let index = clusterUntilK(edges: sortedEdges, parent: &parent, rank: &rank, k: k, initialClusters: numberOfVertices)

        return findMaxSpacing(edges: sortedEdges, parent: &parent, startIndex: index)
    }

    private static func clusterUntilK(
        edges: [WheightedEdge],
        parent: inout [Int],
        rank: inout [Int],
        k: Int,
        initialClusters: Int
    ) -> Int {
        var currentClusters = initialClusters
        var index = 0
        
        while currentClusters > k && index < edges.count {
            let edge = edges[index]
            if union(node1: edge.vertices.0, node2: edge.vertices.1, parent: &parent, rank: &rank) {
                currentClusters -= 1
            }
            index += 1
        }
        
        return index
    }

    private static func findMaxSpacing(
        edges: [WheightedEdge],
        parent: inout [Int],
        startIndex: Int
    ) -> Int {
        var index = startIndex
        
        while index < edges.count {
            let edge = edges[index]
            let root1 = find(node: edge.vertices.0, parent: &parent)
            let root2 = find(node: edge.vertices.1, parent: &parent)
            
            if root1 != root2 {
                return edge.cost
            }
            
            index += 1
        }
        
        return -1
    }
    
}

extension Kruskal {
    
    static func countClustersWithSpacingAtLeast3(from labelToIndex: [String: Int]) -> Int {
        // Pega o maior índice presente (ex: se algum índice é 200000)
        guard let maxIndex = labelToIndex.values.max() else { return -1 }

        var parent = Array(0...maxIndex)
        var rank = Array(repeating: 0, count: maxIndex + 1)

        for (label, index) in labelToIndex {
            let neighbors = generateHammingNeighbors(for: label)
            for neighbor in neighbors {
                if let neighborIndex = labelToIndex[neighbor] {
                    union(node1: index, node2: neighborIndex, parent: &parent, rank: &rank)
                }
            }
        }

        var uniqueRoots: Set<Int> = []
        for i in 1...maxIndex {
            uniqueRoots.insert(find(node: i, parent: &parent))
        }

        return uniqueRoots.count
    }

    private static func generateHammingNeighbors(for label: String) -> [String] {
        let bits = Array(label)
        var neighbors: Set<String> = []

        for i in 0..<bits.count {
            var flipped = bits
            flipped[i] = flipped[i] == "0" ? "1" : "0"
            neighbors.insert(String(flipped))

            for j in (i+1)..<bits.count {
                var flippedTwice = flipped
                flippedTwice[j] = flippedTwice[j] == "0" ? "1" : "0"
                neighbors.insert(String(flippedTwice))
            }
        }

        return Array(neighbors)
    }
}

