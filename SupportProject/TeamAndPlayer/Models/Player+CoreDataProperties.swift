//
//  Player+CoreDataProperties.swift
//  SupportProject
//
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var isAvailable: Bool
    @NSManaged public var team: Team?
    
    // Handle Optional Values
    public var wrappedLastName: String {
        lastName ?? "No Last Name"
    }
    public var wrappedFirstName: String {
        firstName ?? "No First Name"
    }

}

extension Player : Identifiable {

}
