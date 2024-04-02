//
//  UserData.swift
//  IOSExam
//
//  Created by willaim santos on 17/03/24.
//

import Foundation

struct UserDataDTO {
    
    static func loadUsersDTOs() -> [User] {
        
        // read the json file
        guard let path = Bundle.main.path(forResource: "Users", ofType: "json") else {
            fatalError("Path for Users.json was not found")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Unable to load data!")
        }
        
        guard let userDTO = try? JSONDecoder().decode([User].self, from: data) else {
            fatalError("Unable to decode data!")
        }
        
        return userDTO
    }
}
