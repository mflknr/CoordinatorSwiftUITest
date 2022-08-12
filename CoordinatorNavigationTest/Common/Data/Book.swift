//
//
// Created by __FULLUSERNAME__ on __DATE__.
// 
//
	

import Foundation

struct Book: Identifiable {
    var name: String
    var bookId: String
    var id: String { bookId }
}
