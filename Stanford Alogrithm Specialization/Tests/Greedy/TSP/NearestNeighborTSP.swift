//
//  NearestNeighborTSP.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

struct NearestNeighborTSP {
    
    static func approximateTourCost(for cities: [NamedPoint]) -> Int {
        guard let startIndex = indexOfCityWithSmallestID(in: cities) else { return 0 }
        return computeTotalTourCost(startingFrom: startIndex, over: cities)
    }

    private static func computeTotalTourCost(startingFrom startIndex: Int, over cities: [NamedPoint]) -> Int {
        var visited = Set([startIndex])
        var currentIndex = startIndex
        var totalDistance = 0

        while visited.count < cities.count {
            let nextIndex = findNearestUnvisitedCity(from: currentIndex, in: cities, excluding: visited)
            totalDistance += calculateDistance(from: cities[currentIndex], to: cities[nextIndex])
            visited.insert(nextIndex)
            currentIndex = nextIndex
        }

        totalDistance += calculateDistance(from: cities[currentIndex], to: cities[startIndex])
        return totalDistance
    }

    private static func findNearestUnvisitedCity(
        from currentIndex: Int,
        in cities: [NamedPoint],
        excluding visited: Set<Int>
    ) -> Int {
        return cities.indices
            .filter { !visited.contains($0) }
            .min { lhs, rhs in
                let lhsDistance = calculateDistance(from: cities[currentIndex], to: cities[lhs])
                let rhsDistance = calculateDistance(from: cities[currentIndex], to: cities[rhs])
                return lhsDistance < rhsDistance || (lhsDistance == rhsDistance && cities[lhs].id < cities[rhs].id)
            }!
    }

    private static func calculateDistance(from a: NamedPoint, to b: NamedPoint) -> Int {
        let dx = a.x - b.x
        let dy = a.y - b.y
        return Int((dx * dx + dy * dy).squareRoot().rounded()) // ✅ Arredonda, depois converte para Int
    }

    private static func indexOfCityWithSmallestID(in cities: [NamedPoint]) -> Int? {
        return cities.indices.min { cities[$0].id < cities[$1].id }
    }
}
