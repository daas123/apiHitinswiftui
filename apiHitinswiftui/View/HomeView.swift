//
//  HomeView.swift
//  apiHitinswiftui
//
//  Created by Neosoft on 23/11/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
                    List(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .foregroundColor(.secondary)
                        }
                    }
                    .navigationBarTitle("Users")
                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
