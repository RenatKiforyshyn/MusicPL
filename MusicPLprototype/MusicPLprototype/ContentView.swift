//
//  ContentView.swift
//  MusicPLprototype
//
//  Created by AM Student on 10/24/24.
//
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false

    var body: some View {
        VStack {
            Image(systemName: "music.note")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("play")
            
            HStack {
                Button(action: {
                    playMusic()
                }) {
                    Text("Start")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    stopMusic()
                }) {
                    Text("Stop")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear {
            setupAudioPlayer()
        }
    }

    func setupAudioPlayer() {
        if let path = Bundle.main.path(forResource: "your_song", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        }
    }

    func playMusic() {
        audioPlayer?.play()
        isPlaying = true
    }

    func stopMusic() {
        audioPlayer?.stop()
        isPlaying = false
    }
}

#Preview {
    ContentView()
}
