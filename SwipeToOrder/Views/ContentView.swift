//
//  ContentView.swift
//  SwiftUICustomSlider
//
//  Created by Tilak Shakya on 27/07/24.
//
import SwiftUI


struct ContentView: View {
    // State variables to manage the UI state
    @State private var offset: CGFloat = 0
    @State private var isOrder: Bool = false
    @State private var currentIcon: String = SFSymbol.arrowForwardCircleFill
    @State private var buttonTitle: String = ConstantString.swipeToOrder
    @State private var progress: CGFloat = 0

    var body: some View {
        // GeometryReader to get the size of the parent container
        GeometryReader { geometry in
            VStack {
                ZStack {
                    HStack {
                        // Draggable icon
                        Image(systemName: currentIcon)
                            .resizable()
                            .frame(width: 62, height: 62)
                            .offset(x: offset)
                            .foregroundColor(.white)
                            .gesture(
                                // Drag gesture to handle dragging of the icon
                                DragGesture()
                                    .onChanged { gesture in
                                        if !isOrder {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                // Update the offset based on drag gesture
                                                self.offset = max(0, min(gesture.translation.width, geometry.size.width - 75))
                                            }
                                            
                                            // Calculate progress based on offset
                                            let maxOffset = geometry.size.width - 75
                                            self.progress = self.offset / maxOffset
                                            
                                            // Update icon and title based on progress
                                            updateIconAndTitle()
                                        }
                                    }
                                    .onEnded { _ in
                                        // Threshold to determine if the drag is sufficient to place an order
                                        let threshold = geometry.size.width * 0.7
                                        if self.offset >= threshold {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                // Set order state to true and snap the icon to the right
                                                self.isOrder = true
                                                self.offset = geometry.size.width - 75
                                                self.progress = 1.0
                                            }
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                // Reset the offset and progress if drag is insufficient
                                                self.offset = 0
                                                self.progress = 0
                                            }
                                        }
                                        // Update icon and title based on progress
                                        updateIconAndTitle()
                                    }
                            )
                        
                        Spacer()
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.green)
                    .cornerRadius(32.5)
                    
                    // Button title text
                    Text(buttonTitle)
                        .frame(height: 62)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color.white)
                        .animation(.easeInOut, value: buttonTitle)
                }
                .frame(width: geometry.size.width)
            }
        }
        .padding(5)
    }
    
    // Function to update the icon and title based on progress
    private func updateIconAndTitle() {
        if progress >= 0.7 {
            self.currentIcon = SFSymbol.checkmarkCircleFill
            self.buttonTitle = ConstantString.thankYou
        } else {
            self.currentIcon = SFSymbol.arrowForwardCircleFill
            self.buttonTitle = ConstantString.swipeToOrder
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

