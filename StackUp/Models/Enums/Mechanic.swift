//
//  Mechanic.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

enum Mechanic: String, CaseIterable, Encodable, Decodable, RawRepresentable, Hashable {
    case isolation
    case compound
    case null
}
