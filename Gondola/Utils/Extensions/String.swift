//
//  String.swift
//
//  Created by MARCELO GRACIETTI on 12/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let phoneRegEx = "[0-9]{10,11}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    var isValidCNPJ: Bool {
        let cnpjRegEx = "[0-9]{2}.?[0-9]{3}.?[0-9]{3}/?[0-9]{4}-?[0-9]{2}"
        let cnpjTest = NSPredicate(format:"SELF MATCHES %@", cnpjRegEx)
        return cnpjTest.evaluate(with: self)
    }
    
    var isValidCPF: Bool {
        let cpfRegEx = "[0-9]{3}.?[0-9]{3}.?[0-9]{3}-?[0-9]{2}"
        let cpfTest = NSPredicate(format:"SELF MATCHES %@", cpfRegEx)
        return cpfTest.evaluate(with: self)
    }
    
    var isValidAccount: Bool {
        let accountRegEx = "[0-9]{2,6}.?[0-9]{2,6}-[A-Z0-9a-z]{1,2}"
        let accountTest = NSPredicate(format:"SELF MATCHES %@", accountRegEx)
        return accountTest.evaluate(with: self)
    }
    
    var isValidAgency: Bool {
        let agencyRegEx = "[0-9]{2,5}-[0-9]{1}"
        let agencyTest = NSPredicate(format:"SELF MATCHES %@", agencyRegEx)
        return agencyTest.evaluate(with: self)
    }
    var isValidBank: Bool {
        let bankRegEx = "[A-Z0-9a-z._ -]{2,5}-[A-Z0-9a-z._ -]{2,64}"
        let bankTest = NSPredicate(format:"SELF MATCHES %@", bankRegEx)
        return bankTest.evaluate(with: self)
    }
    
    var isValidUser: Bool {
        let emailRegEx = "[A-Z0-9a-z._ -]{6,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidName: Bool {
        let nameRegEx = "[A-Za-z ]{6,64}"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: self)
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
    }
    
    var integer: Int {
        return Int(digits) ?? 0
    }
    
    var double: Double {
        return Double(digits) ?? 0.0
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    mutating func replace(_ originalString:String, with newString:String) {
        self = self.replacingOccurrences(of: originalString, with: newString)
    }
    
    func maskCNPJ() -> String {
        
        var maskedCNPJ = self.digits
        let cnpjLength = maskedCNPJ.characters.count
        
        switch cnpjLength {
        case 3...5:
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 2))
        case 6...8:
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 2))
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 6))
        case 9...12:
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 2))
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 6))
            maskedCNPJ.insert("/", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 10))
        case 13...14:
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 2))
            maskedCNPJ.insert(".", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 6))
            maskedCNPJ.insert("/", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 10))
            maskedCNPJ.insert("-", at: maskedCNPJ.index(maskedCNPJ.startIndex, offsetBy: 15))
        default:
            maskedCNPJ = self.digits
        }
        
        return maskedCNPJ
    }
    
    func maskCPF() -> String {
        
        var maskedCPF = self.digits
        let cpfLength = maskedCPF.characters.count
        
        switch cpfLength {
        case 4...6:
            maskedCPF.insert(".", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 3))
        case 7...9:
            maskedCPF.insert(".", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 3))
            maskedCPF.insert(".", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 7))
        case 10...11:
            maskedCPF.insert(".", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 3))
            maskedCPF.insert(".", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 7))
            maskedCPF.insert("-", at: maskedCPF.index(maskedCPF.startIndex, offsetBy: 11))
        default:
            maskedCPF = self.digits
        }
        return maskedCPF
    }
    
    func maskBankData() -> String {
        
        var maskedBankData = self.digits
        let bankDataLength = maskedBankData.characters.count
        
        switch bankDataLength {
        case 2...10:
            maskedBankData.insert("-", at: maskedBankData.index(maskedBankData.startIndex, offsetBy: bankDataLength-1))
        default:
            maskedBankData = self.digits
        }
        return maskedBankData
    }
    
    func maskPhoneNumber() -> String {
        
        var maskedPhone = self.digits
        let phoneLength = maskedPhone.characters.count
        
        switch phoneLength {
        case 1...2:
            maskedPhone.insert("(", at: maskedPhone.startIndex)
        case 3...6:
            maskedPhone.insert("(", at: maskedPhone.startIndex)
            maskedPhone.insert(")", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 3))
            maskedPhone.insert(" ", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 4))
        case 7...10:
            maskedPhone.insert("(", at: maskedPhone.startIndex)
            maskedPhone.insert(")", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 3))
            maskedPhone.insert(" ", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 4))
            maskedPhone.insert("-", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 9))
        case 7...11:
            maskedPhone.insert("(", at: maskedPhone.startIndex)
            maskedPhone.insert(")", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 3))
            maskedPhone.insert(" ", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 4))
            maskedPhone.insert("-", at: maskedPhone.index(maskedPhone.startIndex, offsetBy: 10))
        default:
            maskedPhone = self.digits
        }
        return maskedPhone
    }
    
    func maskPaymentValue(withCurrency insertCurrency: Bool = false) -> String {
        
        var paymentValue = String(self.digits.integer)
        let paymentLength = paymentValue.characters.count
        
        if paymentLength > 0 {
            if paymentValue.substring(to: 1) == "0" {
                return ""
            }
        }
        switch paymentLength {
        case 1:
            paymentValue.insert("0", at: paymentValue.startIndex)
            paymentValue.insert(",", at: paymentValue.startIndex)
            paymentValue.insert("0", at: paymentValue.startIndex)
        case 2:
            paymentValue.insert(",", at: paymentValue.startIndex)
            paymentValue.insert("0", at: paymentValue.startIndex)
        case 3...5:
            paymentValue.insert(",", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength-2))
        case 6...8:
            paymentValue.insert(",", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength-2))
            paymentValue.insert(".", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength-5))
        case 9...20:
            paymentValue = paymentValue.substring(to: 8)
            paymentValue.insert(",", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength-3))
            paymentValue.insert(".", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength-6))
        default:
            paymentValue = self.digits
        }
        
        if !paymentValue.isEmpty, insertCurrency {
            paymentValue = "VALUE_WITH_CURRENCY".localizedFormat(paymentValue)
        }
        return paymentValue
    }

    
    func maskWithPercentage() -> String {
        var paymentValue = self.digits
        let paymentLength = paymentValue.characters.count
        if paymentLength > 0 {
            if paymentValue.substring(to: 1) == "0" {
                return ""
            }
        }
        paymentValue.insert("%", at: paymentValue.index(paymentValue.startIndex, offsetBy: paymentLength))
        return paymentValue
    }
    
}
