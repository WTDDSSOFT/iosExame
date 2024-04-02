//
//  Phot.swift
//  IOSExam
//
//  Created by willaim santos on 16/03/24.
//

import Foundation

struct Photo: Codable, Hashable {
    
    var albumID, id: Int?
    var title: String?
    var url, thumbnailURL: String?
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
