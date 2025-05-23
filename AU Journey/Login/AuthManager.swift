//
//  AuthManager.swift
//  AU Journey
//
//  Created by Paing Thu Ta on 23/5/25.
//

import Foundation
import MSAL
import UIKit

class AuthManager {
    static let shared = AuthManager()

    private var applicationContext: MSALPublicClientApplication?

    private let clientId = "865e92d6-3eba-43bc-b016-ae6806198910"
    private let tenantId = "c1f3dc23-b7f8-48d3-9b5d-2b12f158f01f"
    private let redirectUri = "msauth.AU.AU-Journey://auth"

    func setup() {
        do {
            let authority = try MSALAADAuthority(url: URL(string: "https://login.microsoftonline.com/\(tenantId)")!)
            let config = MSALPublicClientApplicationConfig(clientId: clientId, redirectUri: redirectUri, authority: authority)
            applicationContext = try MSALPublicClientApplication(configuration: config)
        } catch {
            print("Error setting up MSAL: \(error)")
        }
    }

    func signIn(presentingViewController: UIViewController, completion: @escaping (String?) -> Void) {
        guard let appContext = applicationContext else {
            completion(nil)
            return
        }

        let webParameters = MSALWebviewParameters(authPresentationViewController: presentingViewController)
        let parameters = MSALInteractiveTokenParameters(scopes: ["user.read"], webviewParameters: webParameters)

        appContext.acquireToken(with: parameters) { result, error in
            if let error = error {
                print("Sign-in failed: \(error)")
                completion(nil)
                return
            }

            guard let result = result else {
                print("No result returned")
                completion(nil)
                return
            }

            print("Access token: \(result.accessToken)")
            completion(result.accessToken)
        }
    }
}
