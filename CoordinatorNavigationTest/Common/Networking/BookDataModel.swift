//
//  MainCoordinator.swift
//  CoordinatorNavigationTest
//
//  Created by Marius Felkner on 26.07.22.
//
	
import Foundation

struct BookDataModel: Codable {
    var docs: [Doc]
    var total, limit, offset, page: Int
    var pages: Int
}

struct Doc: Codable {
    var id: String
    var chapterName: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case chapterName
        case name
    }
}
