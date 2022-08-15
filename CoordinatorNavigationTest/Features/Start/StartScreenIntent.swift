//
//  StartScreenIntent.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

enum StartScreenIntent {
    case showWeb
    case showAuth
    case showDetails(Book)
    case resetTap
    case toggle(Bool)
}
