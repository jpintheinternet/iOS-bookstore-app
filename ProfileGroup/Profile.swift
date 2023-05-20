//
//  Profile.swift
//  CS4540Book
//
//  Created by Jean Paul Espinosa on 7/8/22.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var readingFreqPhoto = readingFreq.library
    var updateDate = Date()
    
    static let `default` = Profile(username: "David")
    
    enum readingFreq: String, Identifiable, CaseIterable {
        case beginner = "📃"
        case weekend = "📔"
        case avid = "📖"
        case library = "📚"
        
        var id: String { rawValue }
    }
}
