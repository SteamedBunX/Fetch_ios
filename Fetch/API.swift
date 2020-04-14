// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AuthInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - clientId
  ///   - idToken
  public init(clientId: String, idToken: String) {
    graphQLMap = ["client_id": clientId, "id_token": idToken]
  }

  public var clientId: String {
    get {
      return graphQLMap["client_id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "client_id")
    }
  }

  public var idToken: String {
    get {
      return graphQLMap["id_token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id_token")
    }
  }
}

public enum Size: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case small
  case medium
  case large
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "SMALL": self = .small
      case "MEDIUM": self = .medium
      case "LARGE": self = .large
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .small: return "SMALL"
      case .medium: return "MEDIUM"
      case .large: return "LARGE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Size, rhs: Size) -> Bool {
    switch (lhs, rhs) {
      case (.small, .small): return true
      case (.medium, .medium): return true
      case (.large, .large): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Size] {
    return [
      .small,
      .medium,
      .large,
    ]
  }
}

public enum Age: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case young
  case adult
  case senior
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "YOUNG": self = .young
      case "ADULT": self = .adult
      case "SENIOR": self = .senior
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .young: return "YOUNG"
      case .adult: return "ADULT"
      case .senior: return "SENIOR"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Age, rhs: Age) -> Bool {
    switch (lhs, rhs) {
      case (.young, .young): return true
      case (.adult, .adult): return true
      case (.senior, .senior): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Age] {
    return [
      .young,
      .adult,
      .senior,
    ]
  }
}

public enum Activity: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case aCouchPotato
  case active
  case anAthlete
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "A_COUCH_POTATO": self = .aCouchPotato
      case "ACTIVE": self = .active
      case "AN_ATHLETE": self = .anAthlete
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .aCouchPotato: return "A_COUCH_POTATO"
      case .active: return "ACTIVE"
      case .anAthlete: return "AN_ATHLETE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Activity, rhs: Activity) -> Bool {
    switch (lhs, rhs) {
      case (.aCouchPotato, .aCouchPotato): return true
      case (.active, .active): return true
      case (.anAthlete, .anAthlete): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Activity] {
    return [
      .aCouchPotato,
      .active,
      .anAthlete,
    ]
  }
}

public enum Dependency: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case independent
  case somewhatDependent
  case dependent
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "INDEPENDENT": self = .independent
      case "SOMEWHAT_DEPENDENT": self = .somewhatDependent
      case "DEPENDENT": self = .dependent
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .independent: return "INDEPENDENT"
      case .somewhatDependent: return "SOMEWHAT_DEPENDENT"
      case .dependent: return "DEPENDENT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Dependency, rhs: Dependency) -> Bool {
    switch (lhs, rhs) {
      case (.independent, .independent): return true
      case (.somewhatDependent, .somewhatDependent): return true
      case (.dependent, .dependent): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Dependency] {
    return [
      .independent,
      .somewhatDependent,
      .dependent,
    ]
  }
}

public enum Social: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case aWallFlower
  case social
  case lifeOfTheParty
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "A_WALL_FLOWER": self = .aWallFlower
      case "SOCIAL": self = .social
      case "LIFE_OF_THE_PARTY": self = .lifeOfTheParty
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .aWallFlower: return "A_WALL_FLOWER"
      case .social: return "SOCIAL"
      case .lifeOfTheParty: return "LIFE_OF_THE_PARTY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Social, rhs: Social) -> Bool {
    switch (lhs, rhs) {
      case (.aWallFlower, .aWallFlower): return true
      case (.social, .social): return true
      case (.lifeOfTheParty, .lifeOfTheParty): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Social] {
    return [
      .aWallFlower,
      .social,
      .lifeOfTheParty,
    ]
  }
}

public enum Trainability: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case classClown
  case attentiveStudent
  case teachersPet
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CLASS_CLOWN": self = .classClown
      case "ATTENTIVE_STUDENT": self = .attentiveStudent
      case "TEACHERS_PET": self = .teachersPet
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .classClown: return "CLASS_CLOWN"
      case .attentiveStudent: return "ATTENTIVE_STUDENT"
      case .teachersPet: return "TEACHERS_PET"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Trainability, rhs: Trainability) -> Bool {
    switch (lhs, rhs) {
      case (.classClown, .classClown): return true
      case (.attentiveStudent, .attentiveStudent): return true
      case (.teachersPet, .teachersPet): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Trainability] {
    return [
      .classClown,
      .attentiveStudent,
      .teachersPet,
    ]
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($auth: AuthInput!) {
      createUser(auth: $auth, user: {zipcode: "99999"}) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Login"

  public var auth: AuthInput

  public init(auth: AuthInput) {
    self.auth = auth
  }

  public var variables: GraphQLMap? {
    return ["auth": auth]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["auth": GraphQLVariable("auth"), "user": ["zipcode": "99999"]], type: .object(CreateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["JWT"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "JWT", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class IsUserOnboardedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query IsUserOnboarded {
      currentUser {
        __typename
        pet_size_preference
      }
    }
    """

  public let operationName: String = "IsUserOnboarded"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("currentUser", type: .nonNull(.object(CurrentUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentUser: CurrentUser) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentUser": currentUser.resultMap])
    }

    public var currentUser: CurrentUser {
      get {
        return CurrentUser(unsafeResultMap: resultMap["currentUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "currentUser")
      }
    }

    public struct CurrentUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("pet_size_preference", type: .scalar(Size.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(petSizePreference: Size? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "pet_size_preference": petSizePreference])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var petSizePreference: Size? {
        get {
          return resultMap["pet_size_preference"] as? Size
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_size_preference")
        }
      }
    }
  }
}

public final class GetRandomPetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRandomPet($queuedPets: [ID]) {
      randomPet(queuedPets: $queuedPets) {
        __typename
        photos
        id
        name
        age
        size
        pet_activity_value
        pet_dependency_value
        pet_social_value
        pet_trainability_value
      }
    }
    """

  public let operationName: String = "GetRandomPet"

  public var queuedPets: [GraphQLID?]?

  public init(queuedPets: [GraphQLID?]? = nil) {
    self.queuedPets = queuedPets
  }

  public var variables: GraphQLMap? {
    return ["queuedPets": queuedPets]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("randomPet", arguments: ["queuedPets": GraphQLVariable("queuedPets")], type: .object(RandomPet.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(randomPet: RandomPet? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "randomPet": randomPet.flatMap { (value: RandomPet) -> ResultMap in value.resultMap }])
    }

    public var randomPet: RandomPet? {
      get {
        return (resultMap["randomPet"] as? ResultMap).flatMap { RandomPet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "randomPet")
      }
    }

    public struct RandomPet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Pet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("photos", type: .list(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("age", type: .nonNull(.scalar(Age.self))),
        GraphQLField("size", type: .nonNull(.scalar(Size.self))),
        GraphQLField("pet_activity_value", type: .scalar(Activity.self)),
        GraphQLField("pet_dependency_value", type: .scalar(Dependency.self)),
        GraphQLField("pet_social_value", type: .scalar(Social.self)),
        GraphQLField("pet_trainability_value", type: .scalar(Trainability.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(photos: [String?]? = nil, id: GraphQLID, name: String? = nil, age: Age, size: Size, petActivityValue: Activity? = nil, petDependencyValue: Dependency? = nil, petSocialValue: Social? = nil, petTrainabilityValue: Trainability? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pet", "photos": photos, "id": id, "name": name, "age": age, "size": size, "pet_activity_value": petActivityValue, "pet_dependency_value": petDependencyValue, "pet_social_value": petSocialValue, "pet_trainability_value": petTrainabilityValue])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var photos: [String?]? {
        get {
          return resultMap["photos"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "photos")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var age: Age {
        get {
          return resultMap["age"]! as! Age
        }
        set {
          resultMap.updateValue(newValue, forKey: "age")
        }
      }

      public var size: Size {
        get {
          return resultMap["size"]! as! Size
        }
        set {
          resultMap.updateValue(newValue, forKey: "size")
        }
      }

      public var petActivityValue: Activity? {
        get {
          return resultMap["pet_activity_value"] as? Activity
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_activity_value")
        }
      }

      public var petDependencyValue: Dependency? {
        get {
          return resultMap["pet_dependency_value"] as? Dependency
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_dependency_value")
        }
      }

      public var petSocialValue: Social? {
        get {
          return resultMap["pet_social_value"] as? Social
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_social_value")
        }
      }

      public var petTrainabilityValue: Trainability? {
        get {
          return resultMap["pet_trainability_value"] as? Trainability
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_trainability_value")
        }
      }
    }
  }
}

public final class LikePetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LikePet($petId: ID!) {
      likePet(petId: $petId, isLiked: true) {
        __typename
        liked_at
      }
    }
    """

  public let operationName: String = "LikePet"

  public var petId: GraphQLID

  public init(petId: GraphQLID) {
    self.petId = petId
  }

  public var variables: GraphQLMap? {
    return ["petId": petId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likePet", arguments: ["petId": GraphQLVariable("petId"), "isLiked": true], type: .object(LikePet.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likePet: LikePet? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likePet": likePet.flatMap { (value: LikePet) -> ResultMap in value.resultMap }])
    }

    public var likePet: LikePet? {
      get {
        return (resultMap["likePet"] as? ResultMap).flatMap { LikePet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likePet")
      }
    }

    public struct LikePet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LikedPet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("liked_at", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(likedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "LikedPet", "liked_at": likedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var likedAt: String? {
        get {
          return resultMap["liked_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked_at")
        }
      }
    }
  }
}

public final class DisLikePetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DisLikePet($petId: ID!) {
      likePet(petId: $petId, isLiked: false) {
        __typename
        liked_at
      }
    }
    """

  public let operationName: String = "DisLikePet"

  public var petId: GraphQLID

  public init(petId: GraphQLID) {
    self.petId = petId
  }

  public var variables: GraphQLMap? {
    return ["petId": petId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likePet", arguments: ["petId": GraphQLVariable("petId"), "isLiked": false], type: .object(LikePet.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likePet: LikePet? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likePet": likePet.flatMap { (value: LikePet) -> ResultMap in value.resultMap }])
    }

    public var likePet: LikePet? {
      get {
        return (resultMap["likePet"] as? ResultMap).flatMap { LikePet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likePet")
      }
    }

    public struct LikePet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LikedPet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("liked_at", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(likedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "LikedPet", "liked_at": likedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var likedAt: String? {
        get {
          return resultMap["liked_at"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked_at")
        }
      }
    }
  }
}
