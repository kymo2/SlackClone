//
//  SignInView.swift
//  SlackClone
//
//  Created by Kyle Mooney on 1/28/25.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // Logo
            Image("slack_logo.svg")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            
            // Title
            Text(viewModel.isCreatingAccount ? "Create Account" : "Sign In")
                .latoFont(weight: .bold, size: 24)
            
            // Email Field
            if viewModel.isCreatingAccount {
                TextField("Your email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .latoFont(size: 16)
            }
            
            // Username Field
            TextField("Your username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .latoFont(size: 16)
            
            // Password Field
            SecureField("Your password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .latoFont(size: 16)
            
            // Error Message
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .latoFont(size: 14)
                    .foregroundColor(.red)
            }
            
            // Sign In / Create Account Button
            Button(action: {
                if viewModel.isCreatingAccount {
                    viewModel.createAccount()
                } else {
                    viewModel.signIn()
                }
            }) {
                Text(viewModel.isCreatingAccount ? "Create Account" : " Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customGreen)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .latoFont(weight: .bold, size: 18)
            }
            
            // Toggle Between Sign-in and Create Account
            HStack {
                Text(viewModel.isCreatingAccount ? "Already have an account?" : "Don't have an account?")
                    .latoFont(size: 14)
                
                Button(action: {
                    withAnimation {
                        viewModel.isCreatingAccount.toggle()
                    }
                }) {
                    Text(viewModel.isCreatingAccount ? "Sign In" : "Create Account")
                        .latoFont(size: 14)
                        .foregroundColor(.blue)
                }
            }
            
            // Success Message
            if viewModel.isAuthenticated {
                Text(viewModel.isCreatingAccount ? "Account Created Successfully" : "Successfully Authenticated!")
                    .latoFont(size: 16)
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
