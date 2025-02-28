//
//  ChatListView.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI

struct ChatListView: View {
    
    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        NavigationStack {
            List(chatViewModel.chats) { chat in
                NavigationLink {
                    if let chatID = chat.id {
                        ChatDetailView(chatID: chatID)
                    }
                } label: {
                    Text(chat.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.white)
                        .clipShape(.rect(cornerRadius: 12))
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(.siDeepPurple)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        chatViewModel.createChat()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ChatListView()
}
