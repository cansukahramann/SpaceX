//
//  LaunchModel.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 1.02.2024.
//

import Foundation

struct LaunchModel: Codable {
    let links: Links
    let staticFireDataUTC: String?
    let name: String?
    let dateUnix: Double?
    let upcoming: Bool?
    let cores: [Core]?
    let id: String
    let flightNumber: Int?
    let datePrecision: String?
    
    enum CodingKeys: String, CodingKey {
        case links, staticFireDataUTC, name, upcoming, cores, id
        case flightNumber = "flight_number"
        case datePrecision = "date_precision"
        case dateUnix = "date_unix"
    }
}

struct Links: Codable {
    let patch: Patch?
    let presskit: String?
    let webcast: String?
    let article: String?
    let wikipedia: String?
}

struct Patch: Codable {
    let small: String?
}

struct Core: Codable {
    let landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: String?
    
    enum CodingKeys: String, CodingKey {
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType =  "landing_type"
    }
}

extension LaunchModel {
    var launchDetails: [LaunchDetail] {
        var array: [LaunchDetail] = []
        
        if let landingAttempt =  cores?.first?.landingAttempt {
            array.append(LaunchDetail(title: "Landing Attempt", value: String(landingAttempt)))
        } else {
            array.append(LaunchDetail(title: "Landing Attempt", value: "-"))
        }
        if let landingSucces = cores?.first?.landingSuccess {
            array.append(LaunchDetail(title: "Landing Success", value: String(landingSucces)))
        } else {
            array.append(LaunchDetail(title: "Landing Success", value: "-"))
        }
        if let landingType = cores?.first?.landingType {
            array.append(LaunchDetail(title: "Landing Type", value: String(landingType)))
        } else {
            array.append(LaunchDetail(title: "Landing Type", value: "-"))
        }
        if let flightNumber {
            array.append(LaunchDetail(title: "Flight Number", value: String(flightNumber)))
        } else {
            array.append(LaunchDetail(title: "Flight Number", value: "-"))
        }
        if let upcoming {
            array.append(LaunchDetail(title: "Upcoming", value: String(upcoming)))
        } else {
            array.append(LaunchDetail(title: "Upcoming", value: "-"))
        }
        if let datePrecision {
            array.append(LaunchDetail(title: "Date Precision", value: String(datePrecision)))
        } else {
            array.append(LaunchDetail(title: "Date Precision", value: "-"))
        }
        return array
    }
}

extension LaunchModel {
    var mediaList: [LaunchMedia] {
        let youtube = LaunchMedia(systemName: "play.fill", title: "YouTube", url: links.webcast)
        let pressKit = LaunchMedia(systemName: "paperplane.fill", title: "PressKit", url: links.presskit)
        let article = LaunchMedia(systemName: "doc.fill", title: "Article", url: links.article)
        let wiki = LaunchMedia(systemName: "building.columns.fill", title: "Wikipedia", url: links.wikipedia)
        return [youtube,pressKit,article,wiki]
    }
}
