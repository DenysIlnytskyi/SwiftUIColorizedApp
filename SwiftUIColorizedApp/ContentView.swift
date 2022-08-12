//
//  ContentView.swift
//  SwiftUIColorizedApp
//
//  Created by Денис Ільницький on 12/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
           // Color(red: red / 255, green: green /  255, blue: blue / 255, opacity: 1).ignoresSafeArea()
            Color(#colorLiteral(red: 0, green: 0.3765624762, blue: 0.7304599881, alpha: 1)).ignoresSafeArea()
            
        VStack(spacing: 40) {
            ColorView(red: red, green: green, blue: blue)
            
            VStack {
                ColorSliderView(sliderValue: $red, color: .red)
                ColorSliderView(sliderValue: $green, color: .green)
                ColorSliderView(sliderValue: $blue, color: .blue)
            }
            .frame(height: 150)
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
