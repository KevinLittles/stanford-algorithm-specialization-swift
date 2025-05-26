//
//  MemoizationKey.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct MemoizationKey: Hashable {
    let itemIndex: Int
    let remainingCapacity: Int
}
