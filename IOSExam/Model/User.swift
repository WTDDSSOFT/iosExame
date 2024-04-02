//
//  User.swift
//  IOSExam
//
//  Created by willaim santos on 17/03/24.
//

import Foundation

// MARK: - UserElement
struct User: Identifiable, Codable, Hashable {
    
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Address
struct Address: Codable, Hashable{
    var street, suite, city, zipcode: String?
    var geo: Geo?
}

// MARK: - Geo
struct Geo: Codable, Hashable{
    var lat, lng: String?
}

// MARK: - Company
struct Company: Codable, Hashable {
    var name, catchPhrase, bs: String?
}
