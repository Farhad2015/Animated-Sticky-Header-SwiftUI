//
//  ContentView.swift
//  AnimatedStickeyHeader
//
//  Created by Mahmudur Rahman on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            Home(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
