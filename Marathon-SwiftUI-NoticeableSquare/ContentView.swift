//
//  ContentView.swift
//  Marathon-SwiftUI-NoticeableSquare
//
//  Created by Sergey Leontiev on 12.12.24..
//

import SwiftUI

struct ContentView: View {
    @State private var squareLocation = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY
    )
    private let colors: [Color] = [.white, .pink, .yellow, .black]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0)  {
                Color.black
                Color.white
                Color.black
                Color.white
            }
            
            VStack(spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    color
                }
            }.overlay {
                Color.black
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .position(x: squareLocation.x, y: squareLocation.y)
                    .blendMode(.destinationOut)
                    .gesture(
                        DragGesture().onChanged { squareLocation = $0.location }
                    )
            }
            .compositingGroup()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
