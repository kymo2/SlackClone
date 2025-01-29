//
//  SignInViewModel.swift
//  SlackClone
//
//  Created by Kyle Mooney on 1/28/25.
//

import Foundation

class SignInViewModel: ObservableObject {

    // Sign-in
    @Published var username: String = ""
    @Published var password: String = ""
    
    // Account creation
    @Published var email: String = ""
    
    // Shared
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var isCreatingAccount: Bool = false
    
    func signIn() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        // placeholder for network call or auth process
        if username == "test" && password == "password" {
            isAuthenticated = true
            errorMessage = ""
        } else {
            errorMessage = "Invalid credentials."
        }
    }
    
    func createAccount() {
        guard !username.isEmpty, !password.isEmpty, !email.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }
        
        // placeholder for account creation call
        if isValidEmail(email) {
            isAuthenticated = true
            isCreatingAccount = true // do i need this
            errorMessage = ""
        } else {
            errorMessage = "Invalid email format."
        }
    }
    
    // make this more comprehensive later on
    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}
