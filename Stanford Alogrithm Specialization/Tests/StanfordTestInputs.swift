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
        let path: String = Bundle(for: Self.self).path(
            forResource: "kargerMinCut",
            ofType: "txt"
        )!
        let text: String = try! .init(
            contentsOfFile: path,
            encoding: .utf8
        )
        
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
        let path: String = Bundle(for: Self.self).path(
            forResource: "mergeSortInversionCount",
            ofType: "txt"
        )!
        let text: String = try! .init(
            contentsOfFile: path,
            encoding: .utf8
        )

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var quickSort: [Int] {
        let path: String = Bundle(for: Self.self).path(
            forResource: "quickSortComparisonCount",
            ofType: "txt"
        )!
        let text: String = try! .init(
            contentsOfFile: path,
            encoding: .utf8
        )

        let lines: [Int] = text.split(separator: "\n").map { Int($0) ?? 0 }
        
        return lines
    }
    
    static var kosaraju: Graph {
        let path: String = Bundle(for: Self.self).path(
            forResource: "largestSCCs",
            ofType: "txt"
        )!
        let text: String = try! .init(
            contentsOfFile: path,
            encoding: .utf8
        )
        
        var graph: Graph = [:]

        let lines: [Substring] = text.split(separator: "\n")
        for line in lines {
            let chars = line.split(separator: " ")
            let numbers = chars.compactMap { Int($0) }
            graph[numbers[0], default: []].append(numbers[1])
        }
        
        return graph
    }
    
}
