# OpenHSV Database Schema

### Person
- id: Int
- firstName: String
- lastName: String
- email: String
- password: String
- passwordConfirmation: String
- categoriesString: String # currently a comma-separated string; this should be its own table relating peopleID with categoryID, for example “Favorites”
- company: String
- twitter: String
- linkedin: String
- url: String
- otherInfo: String
- imageUrl: String
- bio: String
- customUrl: String
- admin: Bool
- approved: Bool

### Category
- id: Int
- parentId: Int
- name: String
- slug: String
- url: String

### Group
- id: Int
- parentId: Int
- name: String
- description: String
- approved: Bool

### Event
- id: Int
- name: String
- approved: Bool
- description: String
- createdAt: Date
- updatedAt: Date
- startTime: Date
- duration: Int # hours, could be hh:mm or Time-like type
- groupId: Int
- venueId: Int
- parentId: Int # event is part of CoWorking #100
- instanceNumber: Int # like parent id, ex. if CoWorking #100, then this 100

### Venue
- id: Int
- name: String

## Changes

- we'll want to change it such that an Event isn't constrained to being hosted by a group, so we'll need some sort of groupId/userId mechanism to have it createable by one or the other
- also I think we'll want to add another table Role and have a foreign key in Person to Role; rather than admin bool
- venue is also due for some more fields — capacity, address, etc
