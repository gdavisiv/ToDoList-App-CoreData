//
//  ContentView.swift
//  ToDoList_CoreData
//
//  Created by George Davis IV on 2/25/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //Create Property Wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItmes:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header:Text("Whats next?")){
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            //
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newTodoItem
                            toDoItem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }
                            //If error Print Error
                            catch {
                                print(error)
                            }
                            self.newTodoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }
                .font(.headline)
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
