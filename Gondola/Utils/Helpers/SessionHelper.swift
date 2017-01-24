//
//  SessionHelper.swift
//
//  Created by MARCELO GRACIETTI on 07/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//


import Foundation
import KeychainSwift
import Crashlytics
import Alamofire
import RealmSwift

class SessionHelper {
    
    // MARK: Static
    
    static let shared = SessionHelper()
    static var userProfile: UserProfile? {
        get {
            let realm = try! Realm()
            return realm.object(ofType: UserProfile.self, forPrimaryKey: profileId)
        }
    }
    static var profileId: String {
        get {
            return UserDefaults.standard.string(forKey: SessionHelper.userIdKey)!
        }
    }
    static var isCompanyProfile: Bool {
        get {
            return UserDefaults.standard.bool(forKey: SessionHelper.companyProfileKey)
        }
    }
    var settingPaymentOngoing = false
    
    private static let hasRunBeforeKey = "hasRunBefore"
    private static let tokenKey = "token"
    private static let userIdKey = "uid"
    private static let companyProfileKey = "companyProfile"
    
    // MARK: Properties
    
    private let keychain = KeychainSwift()
    var sessionToken: String!
    
    private let userDefaults = UserDefaults.standard
    
    var wasUserOnboarded = false
    var isUserLogged: Bool {
        get {
            return sessionToken != nil
        }
    }
    
    var authorizationHeader: [String: String]? {
        get {
            if let token = sessionToken {
                return ["Access-Token": "\(token)", "uid": "\(SessionHelper.profileId)"]
            } else {
                return nil
            }
        }
    }
    
    private init() {
        if !userDefaults.bool(forKey: SessionHelper.hasRunBeforeKey) {
            keychain.clear()
            userDefaults.set(true, forKey: SessionHelper.hasRunBeforeKey)
        }
        
        if let token = keychain.get(SessionHelper.tokenKey) {
            sessionToken = token
        }
    }
    
    // MARK: Private Methods
    
    private func deleteSessionToken() {
        sessionToken = nil
        keychain.delete(SessionHelper.tokenKey)
        handleUserEmail(nil)
    }
    
    // MARK: Public Methods
    
    func createSession(withToken token: String) {
        sessionToken = token
        keychain.set(token, forKey: SessionHelper.tokenKey)
    }
    
    func endSession() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        userDefaults.removeObject(forKey: SessionHelper.userIdKey)
        userDefaults.removeObject(forKey: SessionHelper.companyProfileKey)
        deleteSessionToken()
    }
    
    func handleUserProfile(_ profile: UserProfile) {
        userDefaults.set(profile.email, forKey: SessionHelper.userIdKey)
        saveProfile(profile)
        handleUserEmail(profile.email)
    }
    
    func saveProfile(_ profile: UserProfile) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(profile, update: true)
        }
    }
    
    func logout() {
        endSession()
    }
    
    // MARK: Private methods
    
    private func handleUserEmail(_ email: String?) {
        Crashlytics.sharedInstance().setUserEmail(email)
    }
}
