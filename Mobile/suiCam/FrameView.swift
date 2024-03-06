//
//  FrameView.swift
//  suiCam
//
//  Created by Timothy Khumpan on 2/26/24.
//

import SwiftUI

struct FrameView: View {
    var image: CGImage?
    private let label = Text("frame")
    
    var body: some View {
        if let image = image {
            Image(image, scale: 1.0, orientation:.up, label: label)
        }
        else{
            Color.black
        }
    
        
    }
}

