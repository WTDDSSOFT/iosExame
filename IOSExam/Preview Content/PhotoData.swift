//
//  PhotoData.swift
//  IOSExam
//
//  Created by willaim santos on 15/03/24.
//

import Foundation

struct PhotoDataDTO {
    static func loadPhotosDTOs() -> [Photo] {
        
        // read the json file
        guard let path = Bundle.main.path(forResource: "PhotoAlbum", ofType: "json") else {
            fatalError("Path for quizes.json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        guard let quizesDTO = try? JSONDecoder().decode([Photo].self, from: data) else {
            fatalError("Unable to decode data!")
        }
        
        return quizesDTO
    }    
}
