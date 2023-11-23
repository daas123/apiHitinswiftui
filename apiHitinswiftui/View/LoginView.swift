//
//  LoginView.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State var userName : String = "saad1@gmail.com"
    @State var Password : String = "8080saad"
    @State var isLogin : Bool = false
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack{
                    VStack{
                        Text("User Login")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                        
                        TextField("Enter The UserName", text: $userName)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter The Password", text: $Password)
                            .textFieldStyle(.roundedBorder)
                        
                        Button {
                            viewModel.loginUser(username: userName, password: Password)
                            
                            if ((viewModel.UserData?.data?.username) != nil){
                                isLogin.toggle()
                            }else{
                                isLogin = false
                            }
                        } label: {
                            Text("Login")
                                .font(.title3)
                                .bold()
                                .padding(.horizontal,15)
                                .padding(.vertical,15)
                                .foregroundColor(.red)
                                .background(.white)
                                .cornerRadius(20)
                            
                        }
                        
                        if isLogin{
                            Text("login Successfull")
                        }
                        
                    }.padding(.horizontal)
                        .padding(.top,190)
                }
            }.background(.red)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
