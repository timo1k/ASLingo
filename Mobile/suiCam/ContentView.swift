//
//  ContentView.swift
//  suiCam
//
//  Created by Timothy Khumpan on 2/26/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var frameHandler = FrameHandler() // Initialize the FrameHandler
    
    @State private var selectedTab: Tab = .camera
    
    enum Tab {
        case camera, lesson, profile
    }
    
    var body: some View {
        VStack {
            // Content based on selected tab
            switch selectedTab {
            case .camera:
                CameraView(frameHandler: frameHandler) // Pass frameHandler to CameraView
            case .lesson:
                LessonView()
            case .profile:
                ProfileView()
            }
            
            // Footer bar with buttons
            FooterBar(selectedTab: $selectedTab)
        }
    }
}

struct FooterBar: View {
    @Binding var selectedTab: ContentView.Tab
    
    var body: some View {
        HStack {
            Spacer()
            FooterButton(systemImage: "camera", tab: .camera, selectedTab: $selectedTab)
            Spacer()
            FooterButton(systemImage: "book", tab: .lesson, selectedTab: $selectedTab)
            Spacer()
            FooterButton(systemImage: "person", tab: .profile, selectedTab: $selectedTab)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

struct FooterButton: View {
    let systemImage: String
    let tab: ContentView.Tab
    @Binding var selectedTab: ContentView.Tab
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(selectedTab == tab ? .blue : .gray)
        }
    }
}
