//
//  PhotoViewModel.swift
//  IOSExam
//
//  Created by willaim santos on 16/03/24.
//

import Foundation
import SwiftUI


class PhotoViewModel: ObservableObject {
    
    @Published public var loadPhotosData = PhotoDataDTO.loadPhotosDTOs()
    @Published public var loadUsersData = UserDataDTO.loadUsersDTOs()
    
    @Published public var filterData = [User]()
    
    func searchTextInFields(with searchText: String = "") {
        filterData =  searchText.isEmpty ? loadUsersData : loadUsersData.filter{
            $0.name!.contains(searchText)
        }
    }
    
}
