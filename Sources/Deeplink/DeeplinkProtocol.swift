//
//  DeeplinkProtocol.swift
//  Deeplink
//
//  Created by Paulo Correa on 01/10/2024.
//

import Foundation

public enum DeeplinkType: String {
    case places = "wikipedia://places"
    case other = "wikipedia://other"
}

@MainActor
public protocol DeeplinkOpenerProtocol {
    func openDeeplink(_ url: URL) async
}

@MainActor
public protocol DeeplinkProtocol {
    func openWiki(_ queryItems: [URLQueryItem], type: DeeplinkType) async
}
