//
//  Untitled.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

struct Dynamic {
    
    static func maximumWeightIndependentSet(from weights: [Int]) -> Set<Int> {
        let maxWeightUpToIndex = computeMaxWeightTable(for: weights)
        return reconstructMWIS(from: maxWeightUpToIndex, weights: weights)
    }
    
    static func mwisBitString(for weights: [Int], vertices: [Int]) -> String {
        let mwis = maximumWeightIndependentSet(from: weights)
        return vertices.map { mwis.contains($0) ? "1" : "0" }.joined()
    }

    private static func computeMaxWeightTable(for weights: [Int]) -> [Int] {
        let n = weights.count
        var maxWeightUpToIndex = [Int](repeating: 0, count: n + 1)
        
        maxWeightUpToIndex[0] = 0
        if n > 0 {
            maxWeightUpToIndex[1] = weights[0]
        }

        guard n > 1 else { return maxWeightUpToIndex }

        for i in 2...n {
            maxWeightUpToIndex[i] = max(
                maxWeightUpToIndex[i - 1],
                maxWeightUpToIndex[i - 2] + weights[i - 1]
            )
        }

        return maxWeightUpToIndex
    }

    private static func reconstructMWIS(from maxWeightUpToIndex: [Int], weights: [Int]) -> Set<Int> {
        var i = weights.count
        var mwis = Set<Int>()
        
        while i >= 1 {
            if i == 1 {
                mwis.insert(1)
                break
            } else if maxWeightUpToIndex[i - 1] >= maxWeightUpToIndex[i - 2] + weights[i - 1] {
                i -= 1
            } else {
                mwis.insert(i)
                i -= 2
            }
        }

        return mwis
    }
    
}

// MARK: - Knapsack

extension Dynamic {
    
    static func knapsack01(capacity: Int, items: [KnapsackItem]) -> Int {
        var dp = [Int](repeating: 0, count: capacity + 1)
        
        for item in items {
            guard item.weight <= capacity else { continue }
            
            for w in stride(from: capacity, through: item.weight, by: -1) {
                dp[w] = max(dp[w], dp[w - item.weight] + item.value)
            }
        }
        
        return dp[capacity]
    }
    
}

// MARK: - Knapsack Memoization

extension Dynamic {
    
    static func knapsackRecursiveMemoization(capacity: Int, items: [KnapsackItem]) -> Int {
        var memoizationCache: [MemoizationKey: Int] = [:]
        return solveKnapsack(
            itemIndex: items.count,
            remainingCapacity: capacity,
            items: items,
            cache: &memoizationCache
        )
    }

    private static func solveKnapsack(
        itemIndex: Int,
        remainingCapacity: Int,
        items: [KnapsackItem],
        cache: inout [MemoizationKey: Int]
    ) -> Int {
        if itemIndex == 0 || remainingCapacity == 0 {
            return 0
        }

        let key = MemoizationKey(itemIndex: itemIndex, remainingCapacity: remainingCapacity)

        if let cachedResult = cache[key] {
            return cachedResult
        }

        let result = computeBestOption(
            for: items[itemIndex - 1],
            at: itemIndex,
            remainingCapacity: remainingCapacity,
            items: items,
            cache: &cache
        )

        cache[key] = result
        return result
    }

    private static func computeBestOption(
        for currentItem: KnapsackItem,
        at index: Int,
        remainingCapacity: Int,
        items: [KnapsackItem],
        cache: inout [MemoizationKey: Int]
    ) -> Int {
        let withoutCurrent = solveKnapsack(
            itemIndex: index - 1,
            remainingCapacity: remainingCapacity,
            items: items,
            cache: &cache
        )

        guard currentItem.weight <= remainingCapacity else {
            return withoutCurrent
        }

        let withCurrent = solveKnapsack(
            itemIndex: index - 1,
            remainingCapacity: remainingCapacity - currentItem.weight,
            items: items,
            cache: &cache
        ) + currentItem.value

        return max(withoutCurrent, withCurrent)
    }
    
}
