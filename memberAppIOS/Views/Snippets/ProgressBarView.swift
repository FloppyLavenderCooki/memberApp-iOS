//
//  ProgressBarView.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 27/02/2025.
//
// Custom progressbar

import SwiftUI

struct ProgressBarView: View {
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: progress < 0 ? .trailing : .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 20)
                    .opacity(0.2)
                    .foregroundColor(.gray)
                    .cornerRadius(7.5)
                
                Rectangle()
                    .frame(
                        width: min(abs(progress) * geometry.size.width, geometry.size.width),
                        height: 20
                    )
                    .foregroundColor(.cbBlue)
                    .cornerRadius(7.5)
                
                Image(.progressionStripes)
                    .resizable(resizingMode: .tile)
                    .frame(width: abs(progress) * geometry.size.width)
            }
        }
    }
}

#Preview {
    ProgressBarView(progress: 0.5)
}
