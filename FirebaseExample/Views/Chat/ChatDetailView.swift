//
//  ChatDetailView.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI

struct ChatDetailView: View {
    @StateObject private var messageViewModel: MessageViewModel
    
    init(chatID: String) {
        self._messageViewModel = StateObject(wrappedValue: MessageViewModel(chatID: chatID))
    }
    
    var body: some View {
        VStack {
            List(messageViewModel.messages) { message in
                let fromSelf = message.senderID == messageViewModel.currentUserID ?? ""
                MessageListItem(message: message, fromSelf: fromSelf)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .rotationEffect(Angle(degrees: 180))
            }
            .listStyle(.plain)
            .rotationEffect(Angle(degrees: 180))
            HStack {
                TextField("Message", text: $messageViewModel.messageInput)
                    .appTextFieldStyle()
                
                Button {
                    messageViewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane")
                        .frame(width: 40, height: 40)
                }
                .appButtonStyle()
            }
            .padding()
            .background(.siPurple)
        }
        .background(.siDeepPurple)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    messageViewModel.addUserSheetPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .tint(.siYellow)
            }
        }
        .sheet(isPresented: $messageViewModel.addUserSheetPresented) {
            VStack {
                Text("Gib einen Nutzernamen ein, welchen du zu diesem Chat hinzufügen möchtest!")
                
                TextField("Username", text: $messageViewModel.usernameToAdd)
                    .appTextFieldStyle()
                
                Button {
                    messageViewModel.addUserToChat()
                } label: {
                    Text("Nutzer Hinzufügen")
                }
                .appButtonStyle()
            }
            .padding()
            .maximize()
            .background(.siPurple)
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    NavigationStack {
        ChatDetailView(chatID: "q1VkKnWWDNPIb3AvwbQR")
    }
}
