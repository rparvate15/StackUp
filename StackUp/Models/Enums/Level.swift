//
//  Level.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

enum Level: String, CaseIterable, Encodable, Decodable, RawRepresentable, Hashable {
    case beginner
    case intermediate
    case expert
}
