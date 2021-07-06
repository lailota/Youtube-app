//
//  Constants.swift
//  Youtube-app
//
//  Created by Laila Guzzon Hussein Lailota on 06/07/21.
//

import Foundation

struct Constants {
    
    static var API_KEY = ApiValue.get().key
    static var PLAYLIST_ID = "PLNrotoZZ8BaoXT_LJuwEyESQlctWNDCwD"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
