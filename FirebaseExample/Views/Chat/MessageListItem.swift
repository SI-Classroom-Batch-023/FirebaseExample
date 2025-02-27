//
//  MessageListItem.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI

struct MessageListItem: View {
    
    let message: Message
    let fromSelf: Bool
    
    var body: some View {
        HStack {
            if fromSelf { Spacer() }
            Text(message.text)
                .padding()
                .background(
                    fromSelf
                    ? .siPurple
                    : .siYellow
                )
                .clipShape(.rect(
                    topLeadingRadius: 15,
                    bottomLeadingRadius: fromSelf ? 15 : 0,
                    bottomTrailingRadius: fromSelf ? 0 : 15,
                    topTrailingRadius: 15
                ))
            if !fromSelf { Spacer() }
        }
    }
}

#Preview {
    MessageListItem(
        message: Message(text: "HALLO", senderID: "123"), fromSelf: true
    )
}
