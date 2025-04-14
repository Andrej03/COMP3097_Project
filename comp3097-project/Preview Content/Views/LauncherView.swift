import SwiftUI

struct LauncherView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            TaskListView().navigationBarBackButtonHidden(true)
        } else {
            VStack {
                Spacer()

                Text("Welcome to Your To-Do App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea())
            .onAppear {
                // Timer to transition after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    LauncherView()
} 
