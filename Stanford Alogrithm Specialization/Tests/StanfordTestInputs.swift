//
//  StanfordTestInputs.swift
//  Tests
//
//  Created by Kevin Littles on 25/01/24.
//

import Foundation
import BigInt

final class StanfordTestInputs {
    
    static var karger: Graph {
        let text: String = valueFrom(file: "kargerMinCut")
        
        var graph: Graph = [:]

        let lines: [Substring] = text.split(separator: "\r\n")
        for line in lines {
            let numbers = line.split(separator: "\t").compactMap { Int($0) }
            if let first = numbers.first {
                graph[first] = Array(numbers.dropFirst())
            }
        }
        
        return graph
    }
    
    static var karatsuba: (BigInt, BigInt) {
        ("3141592653589793238462643383279502884197169399375105820974944592",
         "2718281828459045235360287471352662497757247093699959574966967627")
    }
    
    static var mergeSort: [Int] {
        let text: String = valueFrom(file: "mergeSortInversionCount")

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var quickSort: [Int] {
        let text: String = valueFrom(file: "quickSortComparisonCount")

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var kosaraju: Graph {
        let text: String = valueFrom(file: "largestSCCs")
        
        var graph: Graph = [:]

        let lines: [Substring] = text.split(separator: "\n")
        for line in lines {
            let chars = line.split(separator: " ")
            let numbers = chars.compactMap { Int($0) }
            graph[numbers[0], default: []].append(numbers[1])
        }
        
        return graph
    }
    
    static var dijkstra: WeightedGraph {
        let text: String = valueFrom(file: "dijkstraShortestPaths")
        
        var graph: WeightedGraph = [:]
        
        let lines: [Substring] = text.split(separator: "\n")
        for line in lines {
            let pairsAndVertex = line.split(separator: " ")
            for pair in pairsAndVertex[1..<pairsAndVertex.count] {
                let values = pair.split(separator: ",")
                graph[Int(pairsAndVertex.first!)!, default: []].append((vertex: Int(values[0])!, distance: Int(values[1])!))
            }
        }
        
        return graph
    }
    
    static var medianMaintenanceSum: [Int] {
        let text: String = valueFrom(file: "medianMaintenance")

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var twoSumCount: [Int] {
        let text: String = valueFrom(file: "twoSumCount")

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var weightedCompletionTime: [Job] {
        let text: String = valueFrom(file: "weightedCompletionTime")
        
        let lines = text.split(separator: "\n").dropFirst()
        
        var jobs: [Job] = []
        
        lines.forEach {
            let values = $0.split(separator: " ")
            let newJob: Job = .init(weight: Int(values[0])!, length: Int(values[1])!)
            jobs.append(newJob)
        }
        
        return jobs
    }
    
    static var minimumSpanningTree: [WheightedEdge] {
        let text: String = valueFrom(file: "minimumSpanningTree")
        
        let lines = text.split(separator: "\n").dropFirst()
        
        var edges: [WheightedEdge] = []
        
        lines.forEach {
            let values = $0.split(separator: " ")
            let newEdge: WheightedEdge = .init(
                vertices: (Int(values[0])!, Int(values[1])!),
                cost: Int(values[2])!
            )
            edges.append(newEdge)
        }
        
        return edges
    }
    
    static var maxSpacingKClustering: [WheightedEdge] {
        let text: String = valueFrom(file: "maxSpacingKClustering")
        
        let lines = text.split(separator: "\n").dropFirst()
        
        var edges: [WheightedEdge] = []
        
        lines.forEach {
            let values = $0.split(separator: " ")
            let newEdge: WheightedEdge = .init(
                vertices: (Int(values[0])!, Int(values[1])!),
                cost: Int(values[2])!
            )
            edges.append(newEdge)
        }
        
        return edges
    }
    
    static var maxSpacingKClusteringBig: [String: Int] {
        let text: String = valueFrom(file: "maxSpacingKClusterinBig")
        let lines = text.split(separator: "\n")
        
        guard let header = lines.first?.split(separator: " "),
              let _ = Int(header[0]),
              let _ = Int(header[1]) else {
            return [:]
        }
        
        let nodeLines = lines.dropFirst()
        
        let uniqueLabels = Set(nodeLines.map { $0.split(separator: " ").joined() })
        
        var labelToIndex: [String: Int] = [:]
        var nodeIndex = 1
        
        for label in uniqueLabels {
            labelToIndex[label] = nodeIndex
            nodeIndex += 1
        }
        
        return labelToIndex
    }
    
    static var huffmanSymbolWeights: [Int] {
        let text: String = valueFrom(file: "huffmanSymbolWeights")
        
        let lines = text.split(separator: "\n").dropFirst()
        
        let weights: [Int] = lines.compactMap { Int($0) }
        
        return weights
    }
    
    static var maxWeightIndependentSet: [Int] {
        let text: String = valueFrom(file: "maxWeightIndependentSet")
        let lines = text.split(separator: "\n").dropFirst()
        return lines.compactMap { Int($0) }
    }
    
    static var knapsackItems: (capacity: Int, items: [KnapsackItem]) {
        let text: String = valueFrom(file: "knapsack")
        let lines = text.split(separator: "\n")
        
        guard let header = lines.first?.split(separator: " "),
              let capacity = Int(header[0]) else {
            fatalError("Formato inválido no cabeçalho.")
        }
        
        let items: [KnapsackItem] = lines.dropFirst().compactMap {
            let parts = $0.split(separator: " ")
            guard parts.count == 2,
                  let value = Int(parts[0]),
                  let weight = Int(parts[1]) else {
                return nil
            }
            return KnapsackItem(value: value, weight: weight)
        }
        
        return (capacity, items)
    }
    
    static var bigKnapsackItems: (capacity: Int, items: [KnapsackItem]) {
        let text: String = valueFrom(file: "knapsackBig")
        let lines = text.split(separator: "\n")
        
        guard let header = lines.first?.split(separator: " "),
              let capacity = Int(header[0]) else {
            fatalError("Formato inválido no cabeçalho.")
        }
        
        let items: [KnapsackItem] = lines.dropFirst().compactMap {
            let parts = $0.split(separator: " ")
            guard parts.count == 2,
                  let value = Int(parts[0]),
                  let weight = Int(parts[1]) else {
                return nil
            }
            return KnapsackItem(value: value, weight: weight)
        }
        
        return (capacity, items)
    }
    
    static func loadAllPairsGraph(from fileName: String) -> WeightedGraph {
        let text = valueFrom(file: fileName)
        let lines = text.split(separator: "\n")
        
        var graph: WeightedGraph = [:]
        
        for line in lines.dropFirst() {
            let parts = line.split(separator: " ")
            guard parts.count == 3,
                  let u = Int(parts[0]),
                  let v = Int(parts[1]),
                  let w = Int(parts[2]) else {
                continue
            }
            graph[u, default: []].append((vertex: v, distance: w))
        }
        
        return graph
    }

    static var allPairs1: WeightedGraph {
        loadAllPairsGraph(from: "allPairs1")
    }

    static var allPairs2: WeightedGraph {
        loadAllPairsGraph(from: "allPairs2")
    }

    static var allPairs3: WeightedGraph {
        loadAllPairsGraph(from: "allPairs3")
    }
    
    static var tspCities: [Point] {
        let text = valueFrom(file: "tsp")
        let lines = text.split(separator: "\n").dropFirst()
        
        return lines.compactMap { line in
            let parts = line.split(separator: " ")
            guard parts.count == 2,
                  let x = Double(parts[0]),
                  let y = Double(parts[1]) else { return nil }
            return Point(x: x, y: y)
        }
    }
    
    static var tspLargeCities: [NamedPoint] {
        let text = valueFrom(file: "tspLarge")
        let lines = text.split(separator: "\n").dropFirst()
        
        return lines.compactMap { line in
            let parts = line.split(separator: " ")
            guard parts.count == 3,
                  let id = Int(parts[0]),
                  let x = Double(parts[1]),
                  let y = Double(parts[2]) else {
                return nil
            }
            return NamedPoint(id: id, x: x, y: y)
        }
    }
    
    static func twoSATInstance(named fileName: String) -> [(Int, Int)] {
        let text = valueFrom(file: fileName)
        let lines = text.split(separator: "\n").dropFirst()
        
        return lines.compactMap { line in
            let parts = line.split(separator: " ")
            guard parts.count == 2,
                  let a = Int(parts[0]),
                  let b = Int(parts[1]) else { return nil }
            return (a, b)
        }
    }
    
    static func twoSAT1() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat1")
    }

    static func twoSAT2() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat2")
    }

    static func twoSAT3() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat3")
    }

    static func twoSAT4() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat4")
    }

    static func twoSAT5() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat5")
    }

    static func twoSAT6() -> [(Int, Int)] {
        return twoSATInstance(named: "2sat6")
    }
    
    private static func valueFrom(file fileName: String) -> String {
        let path: String = Bundle(for: Self.self).path(
            forResource: fileName,
            ofType: "txt"
        )!
        return try! .init(
            contentsOfFile: path,
            encoding: .utf8
        )
    }
    
}
