//
//  BubblesAnimation.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/3/22.
//
import SwiftUI
import AVKit

struct BubblesAnimation: View {
    @State var scale : CGFloat = 1
    let rouge = Color(red: 0.23, green: 0.05, blue: 0.14)
    
    var body: some View {
        
        ZStack {
            ForEach (1...50, id:\.self) { _ in
                Circle ()
                    /*.foregroundColor(Color (red: .random(in: 0.3...1),
                                            green: 0.1,
                                            blue: .random(in: 0.3...1))) */
                    .foregroundColor(Color("DarkGreen"))
                    .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
                    .animation (Animation.spring (dampingFraction: 0.5)
                                    .repeatForever()
                                    .speed (.random(in: 0.05...0.4))
                                    .delay(.random (in: 0...1)), value: scale
                    )
                
                    .scaleEffect(self.scale * .random(in: 0.1...3))
                    .frame(width: .random(in: 1...50),
                           height: CGFloat.random (in:20...50),
                           alignment: .center)
                    .position(CGPoint(x: .random(in: 0...1112),
                                      y: .random (in:0...834)))
            }
        }
        .onAppear {
            self.scale = 1.2 // default circle scale
        }
        
        .drawingGroup(opaque: false, colorMode: .linear)
        .background(
            Rectangle()
                .foregroundColor(Color("LimeGreen")))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesAnimation()
    }
}
