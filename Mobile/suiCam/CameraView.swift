//
//  CameraView.swift
//  suiCam
//
//  Created by Timothy Khumpan on 3/6/24.
//

import SwiftUI


struct CameraView: View {
    @ObservedObject var frameHandler: FrameHandler

    var body: some View {
        Image(uiImage: frameHandler.frame != nil ? UIImage(cgImage: frameHandler.frame!) : UIImage())
            .resizable()
            .scaledToFit()
    }
}
