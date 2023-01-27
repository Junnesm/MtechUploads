//
//  ContentView.swift
//  Animation
//
//  Created by Junne Murdock on 1/18/23.
//

import SwiftUI

struct cornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: cornerRotateModifier(amount: -90, anchor: .topLeading), identity: cornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
@State private var isShowingRed = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}










//import SwiftUI
//
//struct ContentView: View {
//    @State private var animationAmount = 1.0
//
//    var body: some View {
//        Button("Tap Me") {
//           animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//        Circle()
//            .stroke(.red)
//            .scaleEffect(animationAmount)
//            .opacity(2 - animationAmount)
//            .animation(
//                .easeInOut(duration: 1)
//                    .repeatForever(autoreverses: true),
//                value: animationAmount)
//        )
//        .onAppear {
//            animationAmount = 2
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

































//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var animationAmount = 1.0
//
//    var body: some View {
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//



























//import SwiftUI
//
//struct ContentView: View {
//    @State private var animationAmount = 0.0
//
//    var body: some View {
//        Button("Tap Me") {
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 5, y: 1, z: 6))
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}







































//import SwiftUI
//
//struct ContentView: View {
//    @State private var enabled = false
//
//    var body: some View {
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(nil, value: enabled)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}



























//import SwiftUI
//
//struct ContentView: View {
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    withAnimation {
//                        dragAmount = .zero
//                    }
//                }
//            )
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

































//
//import SwiftUI
//
//struct ContentView: View {
//    let letters = Array("Hello, SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                .animation(
//                    .default.delay(Double(num) / 20),
//                    value: dragAmount)
//        }
//    }
//        .gesture(
//        DragGesture()
//            .onChanged { dragAmount = $0.translation }
//            .onEnded { _ in
//                dragAmount = .zero
//                enabled.toggle()
//            }
//
//
//        )
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


















//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var isShowingRed = false
//
//    var body: some View {
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
