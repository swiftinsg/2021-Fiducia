//
//  FeelingsView.swift
//  Fiducia
//
//  Created by sap on 17/11/21.
//

import SwiftUI


struct FeelingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 25)
            .padding()
    }
    
}

extension Color {
    public static var lightBlue: Color {
        return Color(red: 231.0 / 255.0, green: 239.0 / 255.0, blue: 253.0 / 255.0)
    }
    

    public static var lightGrey: Color {
        return Color(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0)
    }
    
    public static var aquaBlue: Color {
        return Color(red: 114.0 / 255.0, green: 203.0 / 255.0, blue: 210.0 / 255.0)
    }
}


struct FeelingsView: View {
    
    @State var buttonPressed: Int = 0
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10, style:
                                    .continuous)
                .fill(Color.blue.opacity(0.1))
                .frame(height: 85).frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .padding(20)
            
            HStack {
    
                Button("D:")
                {
                    buttonPressed = 1
                    }
                .rotationEffect(Angle(degrees: -90))
                .background(buttonPressed == 1 ? Color.aquaBlue : Color.lightGrey)
                .buttonStyle(FeelingButtonStyle())
                .clipShape(Circle())
                .padding(5)
                Button("):") {
                    buttonPressed = 2
                    
                }
                .rotationEffect(Angle(degrees: -90))
                .background(buttonPressed == 2 ? Color.aquaBlue : Color.lightGrey)
                .buttonStyle(FeelingButtonStyle())
                .clipShape(Circle())
                .padding(5)
                Button(":/") {
                    buttonPressed = 3
                    
                }
                .rotationEffect(Angle(degrees: 90))
                .background(buttonPressed == 3 ? Color.aquaBlue : Color.lightGrey)
                .buttonStyle(FeelingButtonStyle())
                .clipShape(Circle())
                .padding(5)
                
                Button(":)") {
                    buttonPressed = 4
                    
                }
                .rotationEffect(Angle(degrees: 90))
                .background(buttonPressed == 4 ? Color.aquaBlue : Color.lightGrey)
                .buttonStyle(FeelingButtonStyle())
                .clipShape(Circle())
                .padding(5)
                Button(":D") {
                buttonPressed = 5
                    
                }
                .rotationEffect(Angle(degrees: 90))
                .background(buttonPressed == 5 ? Color.aquaBlue : Color.lightGrey)
                .buttonStyle(FeelingButtonStyle())
                .clipShape(Circle())
                .padding(5)
            }
            

        }

    }
}

struct FeelingsView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsView()
    }
}
