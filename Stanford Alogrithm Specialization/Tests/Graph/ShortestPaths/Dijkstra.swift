//
//  Dijkstra.swift
//  Tests
//
//  Created by Kevin Littles on 01/02/24.
//

import Foundation

typealias WeightedGraph = [Int: [(vertex: Int, distance: Int)]]

struct Dijkstra {
    
    typealias Destinations = [Int: (distance: Int, isOpened: Bool)]
    
    static func shortestPaths(for graph: WeightedGraph, from source: Int, maxDistance: Int = .max) -> [Int: Int] {
        var destinations: Destinations = initialDestinations(for: graph, from: source, maxDistance: maxDistance)

        while destinations.contains(where: { $1.isOpened }) {
            let closestDestination: Int = closestDestination(in: destinations)
            
            destinations[closestDestination]?.isOpened = false

            for adjacency
            in graph[closestDestination] ?? []
            where destinations[adjacency.vertex]?.isOpened ?? false {
                
                relax(
                    &destinations[adjacency.vertex]!,
                    adjacencyWeight: adjacency.distance,
                    startDistance: destinations[closestDestination]?.distance ?? 0)
            }
        }

        return .init(uniqueKeysWithValues: destinations.map { ($0.key, $0.value.distance) })
    }
    
    private static func initialDestinations(for graph: WeightedGraph, from source: Int, maxDistance: Int) -> Destinations {
        var destinations: Destinations = .init()
        graph.forEach { adjacency in
            destinations[adjacency.key] = (distance: adjacency.key == source ? 0 : maxDistance, isOpened: true)
        }
        return destinations
    }
    
    private static func closestDestination(in destinations: Destinations) -> Int {
        return destinations.filter {
            $0.value.isOpened
        }.min {
            $0.value.distance < $1.value.distance
        }?.key ?? 0
    }
    
    private static func relax(_ destination: inout (distance: Int, isOpened: Bool), adjacencyWeight: Int, startDistance: Int) {
        
        let newDestinationDistance: Int = adjacencyWeight + startDistance

        if newDestinationDistance < destination.distance {
            destination.distance = newDestinationDistance
        }
    }
    
}
