import SwiftUI


struct ContentView: View {
    @State private var habits = [String: Int]()
    var body: some View {
        NavigationView {
            VStack {
                if habits.isEmpty {
                    Text("No habits here...").font(.system(size: 25))
                } else {
                    List {
                        ForEach(Array(habits.keys), id: \.self) { habit in
                            Text(habit)
                        }
                    }
                }
                NavigationLink(destination: NewHabitView(habits: $habits)){
                    Text("Create a Habit")
                }
                
            }
            .navigationTitle("Habits")
        }
    }
}

struct NewHabitView: View {
    @Binding var habits: [String: Int]
    @State private var habitName: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Name of your habit",
                text: $habitName
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                if !habitName.isEmpty {
                    habits[habitName] = 0
                }
            }) {
                Text("Begin Streak")
            }
            .padding()
        }
        .navigationTitle("Create Habit")
    }
}

#Preview {
    ContentView()
}

