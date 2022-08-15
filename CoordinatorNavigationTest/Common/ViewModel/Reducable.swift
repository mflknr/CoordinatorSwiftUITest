//
//  Reducable.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 12.08.22.
//

import Foundation

protocol Reducable {
    associatedtype PartialState
    mutating func reduce(_ partialState: PartialState)
}
