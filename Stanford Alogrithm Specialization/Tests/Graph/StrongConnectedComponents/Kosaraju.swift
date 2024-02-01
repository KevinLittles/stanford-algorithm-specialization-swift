//
//  Kosaraju.swift
//  Tests
//
//  Created by Kevin Littles on 30/01/24.
//

import Foundation

struct Kosaraju {
    
    static func strongConnectedComponentsSizes(_ graph: Graph) -> [Int] {
        return reverse(strongConnectedComponents(graph).map { $0.count }.sorted())
    }
    
    private static func strongConnectedComponents(_ graph: Graph) -> [[Int]] {
        let finishOrder: [Int] = finishOrder(graph: graph)
        let reversedGraph: Graph = reverse(graph)
        return explore(reversedGraph, inOrder: reverse(finishOrder))
    }
    
    private static func reverse(_ graph: Graph) -> Graph {
        var reversedGraph: Graph = [:]
        for (tail, heads) in graph {
            for head in heads {
                reversedGraph[head, default: []].append(tail)
            }
        }
        return reversedGraph
    }
    
    private static func reverse(_ array: [Int]) -> [Int] {
        var reversedArray: [Int] = []
        for element in array {
            reversedArray.insert(element, at: 0)
        }
        return reversedArray
    }
    
    private static func finishOrder(graph: Graph) -> [Int] {
        var visited: [Int: Bool] = [:]
        var finishStack: [Int] = []
        for tail in graph.keys {
            dfs(graph: graph, tail: tail, visited: &visited, stack: &finishStack)
        }
        return finishStack
    }

    private static func explore(_ graph: Graph, inOrder order: [Int]) -> [[Int]] {
        var visited: [Int: Bool] = [:]
        var sccs: [[Int]] = .init()
        for vertex in order {
            var scc: [Int] = []
            dfs(graph: graph, tail: vertex, visited: &visited, stack: &scc)
            if !scc.isEmpty {
                scc = reverse(scc)
                sccs.append(scc)
            }
        }
        return sccs
    }
    
    private static func dfs(graph: Graph, tail: Int, visited: inout [Int: Bool], stack: inout [Int]) {
        if visited[tail] ?? false {
            return
        }
        
        visited[tail] = true
        for head in graph[tail, default: []] where !(visited[head] ?? false) {
            dfs(graph: graph, tail: head, visited: &visited, stack: &stack)
        }
        
        stack.append(tail)
    }
    
}
