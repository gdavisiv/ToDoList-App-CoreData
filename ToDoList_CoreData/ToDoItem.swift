//
//  ToDoItem.swift
//  ToDoList_CoreData
//
//  Created by George Davis IV on 2/25/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//
//Import Libraries Foundation & CoreData
//TodoItem matches the class name that we created in the Data Model
import Foundation
import CoreData

//Define a public class which will inherit from an NSManaged Object
//To use with with SwiftUI we make it Identifiable so that each managed object
//will be idenfiable when we use it together with the list
public class ToDoItem:NSManagedObject, Identifiable {
    
    //For CoreData to work with our properties we need define our properties as
    //@NSManaged
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}
//We need to Fetch all the elements that we have in our data
extension ToDoItem {
    
    //Use a static function so we don't have to create an object of this class
    //to use the getAllToDo function, we're returning NSFetch that works with
    //ToDoItem as a type
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        
        //
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as!
            NSFetchRequest<ToDoItem>
        
        //Sort our elements by the createdAt property/attribute
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        //Pass along sortDescriptors in an array
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
