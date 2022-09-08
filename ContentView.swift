//
//  ContentView.swift
//  StopWatch
//
//  Created by David on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    
    var body: some View {
        ZStack {
            Color(.cyan)
                .ignoresSafeArea()
            VStack {
                Image("yam-1")
                    .resizable()
                .aspectRatio(contentMode: .fit)
                Spacer()
                Text("Copyright © Beniyam Studios")
                    .padding()
            }
            VStack {
                Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                    .font(.custom("Verdana", size: 90))
                    .padding(.top,100)
                    .padding(.bottom,200)
                    .padding(.trailing,100)
                    .padding(.leading,100)
                
                if stopWatchManager.mode == .stopped {
                    Button(action: {self.stopWatchManager.start()}) {
                        TimerButton(label: "Start  ", buttonColor: .green, textColor: .white)
                    }
                    
                    Button(action: {self.stopWatchManager.stop()}) {
                        TimerButton(label: "Reset ", buttonColor: .red, textColor: .white)
                    }
                    .transition(AnyTransition.opacity.animation(.easeIn))
                }
            
                if stopWatchManager.mode == .running {
                    Button(action: {self.stopWatchManager.pause()}) {
                        TimerButton(label: "Pause ", buttonColor: .brown, textColor: .white)
                    }
                    .transition(AnyTransition.opacity.animation(.easeOut))
                    
                    Button(action: {self.stopWatchManager.stop()}) {
                        TimerButton(label: "Reset ", buttonColor: .red, textColor: .white)
                    }
                    
                }
                if stopWatchManager.mode == .paused {
                    Button(action: {self.stopWatchManager.start()}) {
                        TimerButton(label: "Start  ", buttonColor: .green, textColor: .white)
                    }
                    .transition(AnyTransition.opacity.animation(.easeOut))
                    Button(action: {self.stopWatchManager.stop()}) {
                        TimerButton(label: "Reset ", buttonColor: .red, textColor: .white)
                    }
                }
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
.previewInterfaceOrientation(.portrait)
    }
}

struct TimerButton: View {
    
    let label:String
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        Text(label)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(textColor)
            .padding(.vertical,20)
            .padding(.horizontal,90)
            .background(buttonColor)
            .cornerRadius(30)
            .frame(maxWidth:.infinity)
            .font(.custom("Verdana", size:20))
            .font(Font.headline.weight(.bold))
    }
}
