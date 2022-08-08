//
//  UniversalLinkMapper.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 27.07.22.
//

import Foundation

protocol Deeplink {}

struct StartDetailsDeeplink: Deeplink {
    var text: String
}
