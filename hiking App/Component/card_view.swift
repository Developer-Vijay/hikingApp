//
//  card_view.swift
//  hiking App
//
//  Created by Vijay Sahoo on 15/08/23.
//

import SwiftUI

struct card_view: View {
    //Mark : - Properties
    
    
    @State private var imageNumber:Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet:Bool = false
    
    // MARK: - Functions
    
    func randomImage(){
        print("---the button was pressed--")
        print("Status: Old imge Number= \(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action randome Number")
        } while randomNumber==imageNumber
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("--END---")
        print("\n")
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        Spacer()
                        Button{
                            // ACTION: Show a Sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        // MARK: - Sheet CODE
                        .sheet(isPresented: $isShowingSheet)
                        {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for freinds and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,30)
                // MARK: - Main Content
                ZStack {
                  CustomCircleView()
                   
                    Image("image-\(imageNumber)")
                       .resizable()
                       .scaledToFit()
                       .animation(.easeOut, value: imageNumber)
                }
                // MARK:- Footer
            
                Button{
                    // Action: Generate a random number
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [
                            .customGreenLight,
                            .customGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom)
                        )
                        .shadow(color:.black.opacity(0.25), radius: 0.25,x: 1,y: 2)
                }
                .buttonStyle(GradientButton())
                // VSTACK
            }
        }
        // : Card
        .frame(width: 320,height: 570)
    }
}

struct card_view_Previews: PreviewProvider {
    static var previews: some View {
        card_view()
    }
}
