//
//  TabBarController.swift
//  Flixster Pt.2
//
//  Created by Ashly Ruiz on 3/18/24.
//

import SwiftUI

struct TabBarController: View {
    var body: some View {
        TabView {
            TableView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Table View")
                }
            CollectionView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Collection View")
                }
        }
    }
}

