//
//  ContentView.swift
//  iOS-carfax
//
//  Created by Yinsheng Dong on 2021-12-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
        }
        .onAppear() {
            Api().loadJson { result in
                
            }
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
