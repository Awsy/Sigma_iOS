
import Foundation
import CoreData


extension GitFetchRepository {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GitFetchRepository> {
        return NSFetchRequest<GitFetchRepository>(entityName: "GitFetchRepository")
    }

    @NSManaged public var name: String?

}

extension GitFetchRepository : Identifiable {

}
