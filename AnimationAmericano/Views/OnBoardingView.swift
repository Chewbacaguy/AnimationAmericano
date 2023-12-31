//
//  OnBoardingVie.swift
//  AnimationAmericano
//
//  Created by Santiago Torres Alvarez on 21/11/23.
//

import SwiftUI
import RiveRuntime


struct OnBoardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    
    var body: some View {
        ZStack {
            
            background
            
            content
                .offset(y: showModal ? -50: 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            
            if showModal{
                SigninView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button{
                            withAnimation(.spring()){
                                showModal = false
                            }
                        } label:{
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                            .shadow(color:
                                Color("Shadow").opacity(0.3),
                                        radius: 5, x:0, y:3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
        }
    }
    var background: some View{
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x:200, y:100)
        )
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Santi is Learning Animation")
                .font(.custom("Poppins Bold", size: 55, relativeTo: .largeTitle))
            //       .frame(width:260, alignment: .leading)
            
            
            Text("Its all about ordering your code, using spacers, and applying animation when necesary. Simple details create amazing apps. ")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Keep learning", systemImage: "arrow.forward")
                        .offset(x:4, y:4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y:10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                        withAnimation(.spring()){
                            showModal = true
                        }
                        
                    }
                }
            
            Text("The animations where done playing with frames with Rive and importing the files and calling the animation name 😎")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
}

struct OnBoardingView_Previews:PreviewProvider{
    static var previews: some View{
        OnBoardingView()
    }
}
