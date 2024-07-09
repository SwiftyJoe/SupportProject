//
//  Team+CoreDataProperties.swift
//  SupportProject
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var player: NSSet?
    
    // Handle Optional Values
    public var wrappedName: String {
        name ?? "No Name"
    }
    
    public var playerArray: [Player] {
        let set = player as? Set<Player> ?? []
        
        return set.sorted { $0.wrappedLastName < $1.wrappedLastName }
    }

}

// MARK: Generated accessors for player
extension Team {

    @objc(addPlayerObject:)
    @NSManaged public func addToPlayer(_ value: Player)

    @objc(removePlayerObject:)
    @NSManaged public func removeFromPlayer(_ value: Player)

    @objc(addPlayer:)
    @NSManaged public func addToPlayer(_ values: NSSet)

    @objc(removePlayer:)
    @NSManaged public func removeFromPlayer(_ values: NSSet)

}

extension Team : Identifiable {

}
