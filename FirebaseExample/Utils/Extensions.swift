//
//  Extensions.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

extension View {
    
    func maxWidth() -> some View {
        self
            .frame(maxWidth: .infinity)
    }
    
    func maxHeight() -> some View {
        self
            .frame(maxHeight: .infinity)
    }
    
    func maximize() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func appButtonStyle() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .tint(.siYellow)
            .foregroundStyle(.siDeepPurple)
    }
    
    func appTextFieldStyle() -> some View {
        self
            .maxWidth()
            .padding()
            .background(.white)
            .clipShape(.rect(cornerRadius: 8))
            .foregroundStyle(.black)
            .tint(.black)
    }
    
}
