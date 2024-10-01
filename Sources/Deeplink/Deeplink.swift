//
//  Deeplink.swift
//  Search
//
//  Created by Paulo Correa on 30/09/2024.
//

import SwiftUI

extension UIApplication: DeeplinkOpenerProtocol {
    public func openDeeplink(_ url: URL) {
        UIApplication.shared.open(url)
    }
}

public final class Deeplink: DeeplinkProtocol {
    private let deeplinkOpener: DeeplinkOpenerProtocol

    public init(deeplinkOpener: DeeplinkOpenerProtocol) {
        self.deeplinkOpener = deeplinkOpener
    }
    
    public func openWiki(_ queryItems: [URLQueryItem], deeplinkType: DeeplinkType) async {
        guard let url = buildURL(queryItems, deeplinkType: deeplinkType) else {
            return
        }
        await deeplinkOpener.openDeeplink(url)
    }
    
    private func buildURL(_ queryItems: [URLQueryItem], deeplinkType: DeeplinkType) -> URL? {
        guard let baseURL = URL(string: deeplinkType.rawValue) else {
            return nil
        }

        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        return components?.url
    }
}
