//
//  Deeplink.swift
//  Search
//
//  Created by Paulo Correa on 30/09/2024.
//

import SwiftUI

@MainActor
public protocol DeeplinkOpenerProtocol {
    func openDeeplink(_ url: URL)
}

extension UIApplication: DeeplinkOpenerProtocol {
    public func openDeeplink(_ url: URL) {
        UIApplication.shared.open(url)
    }
}

@MainActor
public protocol DeeplinkProtocol {
    func openWiki(_ queryItems: [URLQueryItem])
}

public final class Deeplink: DeeplinkProtocol {
    private let deeplinkOpener: DeeplinkOpenerProtocol

    public init(deeplinkOpener: DeeplinkOpenerProtocol) {
        self.deeplinkOpener = deeplinkOpener
    }
    
    public func openWiki(_ queryItems: [URLQueryItem]) {
        guard let url = buildURL(queryItems) else {
            return
        }
        deeplinkOpener.openDeeplink(url)
    }
    
    private func buildURL(_ queryItems: [URLQueryItem]) -> URL? {
        guard let baseURL = URL(string: "wikipedia://places") else {
            return nil
        }

        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        return components?.url
    }
}
