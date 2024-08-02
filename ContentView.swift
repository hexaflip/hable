import SwiftUI


struct ContentView: View {
    //I don't know why this is private or why I use @State lol
    @State private var habits = [String: Int]()
    var body: some View {
        NavigationView {
            VStack {
                //check if the dictionary is empty
                if habits.isEmpty {
                    Text("No habits here...").font(.system(size: 25))
                } else {
                    // Display Every Habit in their dictionary
                    List {
                        ForEach(Array(habits.keys), id: \.self) { habit in
                            Text(habit)
                        }
                    }
                }
                //Redirect the user to the habit creation view
                NavigationLink(destination: NewHabitView(habits: $habits)){
                    Text("Create a Habit")
                }
                
            }
            .navigationTitle("Hable")
        }
    }
}

struct NewHabitView: View {
    @Binding var habits: [String: Int]
    @State private var habitName: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Name of your habit",
                text: $habitName
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                //make sure the habit name isn't empty lol
                if habits.keys.contains(habitName)
                {
                    errorMessage = "Habit Already Exists"
                } else if habitName.isEmpty {
                    errorMessage = "Habit Name cannot be left Blank"
                } else{
                    habits[habitName] = 0
                }
            }) {
                Text("Begin Streak")
            }
            if !errorMessage.isEmpty {
                
                Text(errorMessage).foregroundStyle(.red)
                    .padding()
            }
        }
        .navigationTitle("Create Habit")
    }
}

#Preview {
    ContentView()
}

