//
//  HelpKarpTSP.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct HeldKarpTSP {
    
    static func shortestTourCost(for cities: [Point]) -> Double {
        let n = cities.count
        let fullMask = (1 << n) - 1
        var dp: [Int: [Int: Double]] = initializeBaseCases(for: cities)

        for size in 3...n {
            let subsets = generateSubsets(of: n, size: size, including: 0)
            for subset in subsets {
                let mask = bitmask(for: subset)
                dp[mask] = computeMinimumCosts(for: subset, withMask: mask, using: dp, cities: cities)
            }
        }

        return computeFinalTourCost(from: dp, fullMask: fullMask, cities: cities)
    }

    private static func initializeBaseCases(for cities: [Point]) -> [Int: [Int: Double]] {
        var dp: [Int: [Int: Double]] = [:]
        for j in 1..<cities.count {
            let mask = (1 << 0) | (1 << j)
            dp[mask] = [j: cities[0].distance(to: cities[j])]
        }
        return dp
    }

    private static func computeMinimumCosts(for subset: [Int], withMask mask: Int, using dp: [Int: [Int: Double]], cities: [Point]) -> [Int: Double] {
        var result: [Int: Double] = [:]
        
        for j in subset where j != 0 {
            let prevMask = mask ^ (1 << j)
            var minCost = Double.infinity

            for k in subset where k != 0 && k != j {
                guard let prevCost = dp[prevMask]?[k] else { continue }
                let cost = prevCost + cities[k].distance(to: cities[j])
                minCost = min(minCost, cost)
            }
            result[j] = minCost
        }
        
        return result
    }

    private static func computeFinalTourCost(from dp: [Int: [Int: Double]], fullMask: Int, cities: [Point]) -> Double {
        var minTourCost = Double.infinity
        
        for j in 1..<cities.count {
            guard let partialCost = dp[fullMask]?[j] else { continue }
            let fullCost = partialCost + cities[j].distance(to: cities[0])
            minTourCost = min(minTourCost, fullCost)
        }
        
        return minTourCost
    }

    private static func bitmask(for subset: [Int]) -> Int {
        subset.reduce(0) { $0 | (1 << $1) }
    }

    private static func generateSubsets(of n: Int, size: Int, including required: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        func backtrack(start: Int, current: [Int]) {
            if current.count == size {
                if current.contains(required) {
                    result.append(current)
                }
                return
            }
            for i in start..<n {
                backtrack(start: i + 1, current: current + [i])
            }
        }

        backtrack(start: 0, current: [])
        return result
    }
    
}
