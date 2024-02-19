//
//  ContentView.swift
//  quiz
//
//  Created by 木村朋広 on 2024/02/19.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var player: AVAudioPlayer?

    var body: some View {

        VStack {
            Spacer()
            Button {
                    playSound(fileName: "questions")
            } label: {
                Text("クイズ出題！")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } // Button ここまで
            Spacer()
            Button {
                playSound(fileName: "thinking")
            } label: {
                Text("シンキングタイム\n(10秒)")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            } // Button ここまで
            Spacer()
            HStack {
                Button {
                    playSound(fileName: "correct")
                } label: {
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
                Button {
                    playSound(fileName: "incorrect")
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            } // HStack ここまで
            Spacer()
        } // VStack ここまで
        .padding()
    }
    func playSound(fileName: String) {
        if let soundData = NSDataAsset(name: fileName) {
            do{
                player = try AVAudioPlayer(data: soundData.data)
                player?.play()
            } catch {
                print("音楽実行エラー")
            }
        }
    }
}


#Preview {
    ContentView()
}
