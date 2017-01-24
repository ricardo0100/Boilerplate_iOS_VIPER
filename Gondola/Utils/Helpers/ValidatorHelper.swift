//
//  ValidatorHelper.swift
//
//  Created by MARCELO GRACIETTI on 30/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class ValidatorHelper {
    
    static func isUserValid(_ testUser: String?) -> Bool {
        guard let user = testUser else { return false }
        return user.isValidUser
    }
    
    static func isNameValid(_ testName: String?) -> Bool {
        guard let name = testName else { return false }
        return name.isValidName
    }
    
    static func isPasswordValid(_ testPassword: String?) -> Bool {
        guard let password = testPassword else { return false }
        return password.characters.count >= 6
    }
    
    static func isPhoneValid(_ testPhone: String?) -> Bool {
        guard let phone = testPhone else { return false }
        return phone.isValidPhone
    }
    
    static func isEmailValid(_ testEmail: String?) -> Bool {
        guard let email = testEmail else { return false }
        return email.isValidEmail
    }
    
    static func isCompanyValid(_ testCompany: String?) -> Bool {
        guard let company = testCompany else { return false }
        return !company.isEmpty
    }
    
    static func isCnpjValid(_ testCnpj: String?) -> Bool {
        guard let cnpj = testCnpj else { return false }
        return cnpj.isValidCNPJ
    }
    
    static func isCpfValid(_ testCpf: String?) -> Bool {
        guard let cpf = testCpf else { return false }
        return cpf.isValidCPF
    }
    
    static func isBankValid(_ testBank: String?) -> Bool {
        guard let bank = testBank else { return false }
        return bank.isValidBank
    }
    
    static func isAgencyValid(_ testAgency: String?) -> Bool {
        guard let agency = testAgency else { return false }
        return agency.isValidAgency
    }
    
    static func isAccountValid(_ testAccount: String?) -> Bool {
        guard let account = testAccount else { return false }
        return account.isValidAccount
    }
    
    static func createValidCNPJ() -> String {
        
        var cnpj = [0,0,0,0,0,0,0,0,0,0,0,1,0,0]
        var temp1 = 2, temp2 = 3
        var baseDig1 = 5, baseDig2 = 6
        
        for i in 0...7 {
            cnpj[i] = (Int)(arc4random_uniform(9))
            temp1 += cnpj[i] * baseDig1
            temp2 += cnpj[i] * baseDig2
            
            baseDig1 = baseDig1 == 2 ? 9 : baseDig1-1
            baseDig2 = baseDig2 == 2 ? 9 : baseDig2-1
        }
        
        temp1 %= 11
        cnpj[12] = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += cnpj[9] * 2
        temp2 %= 11
        cnpj[13] = temp2 < 2 ? 0 : 11-temp2
        
        return "\(cnpj[0])\(cnpj[1]).\(cnpj[2])\(cnpj[3])\(cnpj[4]).\(cnpj[5])\(cnpj[6])\(cnpj[7])/\(cnpj[8])\(cnpj[9])\(cnpj[10])\(cnpj[11])-\(cnpj[12])\(cnpj[13])"
    }
    
    static func createValidCPF() -> String {
        
        var cpf = [0,0,0,0,0,0,0,0,0,0,0]
        var temp1 = 0,temp2 = 0
        
        for i in 0...8 {
            cpf[i] = (Int)(arc4random_uniform(9))
            temp1 += cpf[i] * (10 - i)
            temp2 += cpf[i] * (11 - i)
        }
        
        temp1 %= 11
        cpf[9] = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += cpf[9] * 2
        temp2 %= 11
        cpf[10] = temp2 < 2 ? 0 : 11-temp2
        
        return "\(cpf[0])\(cpf[1])\(cpf[2]).\(cpf[3])\(cpf[4])\(cpf[5]).\(cpf[6])\(cpf[7])\(cpf[8])-\(cpf[9])\(cpf[10])"
        
    }
    
}
