//
//  HomeProductEntity.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 15.05.2022.
//

import Foundation


struct Products: Codable {
    let id: Int
    let title: String
    let price: Double
    let Description, category: String
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case Description = "description"
        case category, image, rating
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}


