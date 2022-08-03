//
//  ContentView.swift
//  HungryApp
//
//  Created by Daniel Madjar on 7/31/22.
//

import SwiftUI

struct SliderView: View {
    
    let fixedSliderHeight = UIScreen.main.bounds.height / 2
    
    @State var sliderHeight = (UIScreen.main.bounds.height / 2) / 2 // This has to be half of the sliders height.
    @State var answer : Double = 0
    @State var offset : CGFloat = 0
    @State var menuOpened = false
    
    let numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10]
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let interval = (((UIScreen.main.bounds.height / 2 / 2) - 30) * 2.0) / 20.0
    
    var body: some View {
        ZStack {
            Color("Cream").ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    HStack {
                        Spacer()
                        
                        Image("hungryIcon")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                    }
                    .frame(width: width, height: height / 9)
                    
                    HStack {
                        Button {
                            withAnimation {
                                menuOpened = true
                            }
                        } label : {
                            ZStack {
                               Circle()
                                    .fill(Color("LimeGreen"))
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "questionmark")
                                    .foregroundColor(Color("DarkGreen"))
                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: width, height: height / 9, alignment: .topTrailing)
                }
                
                Spacer()
                    .frame(height: height * 0.05)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color("DarkGreen"))
                        .frame(width: width / 5, height: fixedSliderHeight)

                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 10)
                        .fill(.black)
                        .frame(width: width / 7, height: height / 2.1)
                        .blur(radius: 15)
                    
                    VStack {
                        Rectangle()
                            .fill(Color("LimeGreen"))
                            .frame(width: width / 5, height: sliderHeight)
                            .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                       
                    }
                    .frame(width: width / 5, height: fixedSliderHeight, alignment: .bottom)
                    
                    
                    VStack(spacing: 0) {
                        ForEach(numbers, id: \.self) { number in
                            HStack {
                                Spacer()
                                    .frame(width: 5)
                                
                                Rectangle()
                                    .fill(Color("NumberColor"))
                                    .frame(width: 7.5, height: 1)
                                    .opacity(0.75)
                                
                                Spacer()
                                
                                Text("\(number)")
                                    .foregroundColor(Color("NumberColor"))
                                    .font(Font.custom("Avenir Book", size: 11))
                                    .bold()
                                
                                Spacer()
                                
                                Rectangle()
                                    .fill(Color("NumberColor"))
                                    .frame(width: 7.5, height: 1)
                                    .opacity(0.75)
                                
                                Spacer()
                                    .frame(width: 5)
                                
                            }
                            .frame(width: width / 5, height: interval, alignment: .leading)
                        }
                    }
                    .frame(width: width / 5, height: ((fixedSliderHeight / 2) - 30) * 2)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 10)
                        .fill(Color("DarkGreen"))
                        .frame(width: width / 5, height: fixedSliderHeight, alignment: .bottom)
                    
                    Rectangle()
                        .fill(Color("BarColor"))
                        .frame(width: (width / 5) / 2, height: 2)
                        .offset(x: 0, y: offset)
                        .frame(width: width / 5.75, alignment: .trailing)

                    Circle()
                        .fill(Color("LimeGreen"))
                        .frame(width: 30, height: 30)
                        .offset(x: ((width / 5) / 2) + 15, y: offset)
                        .gesture(DragGesture().onChanged({ (value) in
                                if value.location.y >= -(fixedSliderHeight / 2) + 30 && value.location.y <= (fixedSliderHeight / 2) - 30 {
                                        
                                    offset = value.location.y
                                        
                                    if value.location.y > 0 {
                                        withAnimation {
                                            sliderHeight = (fixedSliderHeight / 2) - offset
                                        }
                                    } else if value.location.y < 0 {
                                        withAnimation {
                                            sliderHeight = (fixedSliderHeight / 2) - offset
                                        }
                                    }
                                }
                            }
                        ).onEnded({ (value) in
                            answer = getAnswer(offset: offset)
                            
                            withAnimation {
                                offset = round(answer: answer)
                                if value.location.y > 0 {
                                    withAnimation {
                                        sliderHeight = (fixedSliderHeight / 2) - offset
                                    }
                                } else if value.location.y < 0 {
                                    withAnimation {
                                        sliderHeight = (fixedSliderHeight / 2) - offset
                                    }
                                }
                            }
                            
                            print(offset)
                            print(answer)
                        }))
                }
                
                Spacer()
                    .frame(height: height * 0.05)
                
                Button {
                    print(answer)
                } label: {
                    Text("GO")
                        .font(Font.custom("Avenir Book", size: 30))
                        .padding()
                        .background(Color("DarkGreen"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            if menuOpened {
                InformationMenu(menuOpened: $menuOpened)
            }
        }
    }
    
    func getAnswer(offset: CGFloat) -> Double {
        if offset <= 0 {
            return Darwin.round(Double(abs(offset) / interval))
        } else if offset > 0 {
            return Darwin.round(-(Double(abs(offset) / interval)))
        }
        
        return 0
    }
    
    func round(answer: Double) -> Double {
        return -(interval * answer)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
