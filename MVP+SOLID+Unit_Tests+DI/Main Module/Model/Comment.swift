//
//  Person.swift
//  MVP+SOLID+Unit_Tests+DI
//
//  Created by Danil  on 14.06.2022.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
