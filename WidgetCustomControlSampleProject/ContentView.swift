import SwiftUI

struct ContentView: View {
    @StateObject private var toggleWrapper = ToggleValueWrapper()
    
    var body: some View {
        VStack {
            Text(toggleWrapper.toggleState ? "ON" : "OFF")
                .padding()
            
            // トグルボタンの追加
            Button(action: {
                ToggleValueManager.shared.toggle()
            }) {
                Text("Toggle")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
