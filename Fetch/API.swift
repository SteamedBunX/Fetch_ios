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

public struct UserUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - firstName
  ///   - lastName
  ///   - petActivityPreference
  ///   - petAgePreference
  ///   - petDependencyPreference
  ///   - petDistancePreference
  ///   - petExperienceLevel
  ///   - petGoodWithChildrenPreference
  ///   - petGoodWithDogsPreference
  ///   - petGoodWithCatsPreference
  ///   - petSizePreference
  ///   - petSexPreference
  ///   - petSocialPreference
  ///   - petTrainabilityPreference
  ///   - petTypePreference
  ///   - zipcode
  public init(email: Swift.Optional<String?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, petActivityPreference: Swift.Optional<[Activity?]?> = nil, petAgePreference: Swift.Optional<[Age?]?> = nil, petDependencyPreference: Swift.Optional<[Dependency?]?> = nil, petDistancePreference: Swift.Optional<Int?> = nil, petExperienceLevel: Swift.Optional<Experience?> = nil, petGoodWithChildrenPreference: Swift.Optional<Bool?> = nil, petGoodWithDogsPreference: Swift.Optional<Bool?> = nil, petGoodWithCatsPreference: Swift.Optional<Bool?> = nil, petSizePreference: Swift.Optional<[Size?]?> = nil, petSexPreference: Swift.Optional<[Sex?]?> = nil, petSocialPreference: Swift.Optional<[Social?]?> = nil, petTrainabilityPreference: Swift.Optional<[Trainability?]?> = nil, petTypePreference: Swift.Optional<[`Type`?]?> = nil, zipcode: Swift.Optional<String?> = nil) {
    graphQLMap = ["email": email, "first_name": firstName, "last_name": lastName, "pet_activity_preference": petActivityPreference, "pet_age_preference": petAgePreference, "pet_dependency_preference": petDependencyPreference, "pet_distance_preference": petDistancePreference, "pet_experience_level": petExperienceLevel, "pet_good_with_children_preference": petGoodWithChildrenPreference, "pet_good_with_dogs_preference": petGoodWithDogsPreference, "pet_good_with_cats_preference": petGoodWithCatsPreference, "pet_size_preference": petSizePreference, "pet_sex_preference": petSexPreference, "pet_social_preference": petSocialPreference, "pet_trainability_preference": petTrainabilityPreference, "pet_type_preference": petTypePreference, "zipcode": zipcode]
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["first_name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first_name")
    }
  }

  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["last_name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "last_name")
    }
  }

  public var petActivityPreference: Swift.Optional<[Activity?]?> {
    get {
      return graphQLMap["pet_activity_preference"] as? Swift.Optional<[Activity?]?> ?? Swift.Optional<[Activity?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_activity_preference")
    }
  }

  public var petAgePreference: Swift.Optional<[Age?]?> {
    get {
      return graphQLMap["pet_age_preference"] as? Swift.Optional<[Age?]?> ?? Swift.Optional<[Age?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_age_preference")
    }
  }

  public var petDependencyPreference: Swift.Optional<[Dependency?]?> {
    get {
      return graphQLMap["pet_dependency_preference"] as? Swift.Optional<[Dependency?]?> ?? Swift.Optional<[Dependency?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_dependency_preference")
    }
  }

  public var petDistancePreference: Swift.Optional<Int?> {
    get {
      return graphQLMap["pet_distance_preference"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_distance_preference")
    }
  }

  public var petExperienceLevel: Swift.Optional<Experience?> {
    get {
      return graphQLMap["pet_experience_level"] as? Swift.Optional<Experience?> ?? Swift.Optional<Experience?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_experience_level")
    }
  }

  public var petGoodWithChildrenPreference: Swift.Optional<Bool?> {
    get {
      return graphQLMap["pet_good_with_children_preference"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_good_with_children_preference")
    }
  }

  public var petGoodWithDogsPreference: Swift.Optional<Bool?> {
    get {
      return graphQLMap["pet_good_with_dogs_preference"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_good_with_dogs_preference")
    }
  }

  public var petGoodWithCatsPreference: Swift.Optional<Bool?> {
    get {
      return graphQLMap["pet_good_with_cats_preference"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_good_with_cats_preference")
    }
  }

  public var petSizePreference: Swift.Optional<[Size?]?> {
    get {
      return graphQLMap["pet_size_preference"] as? Swift.Optional<[Size?]?> ?? Swift.Optional<[Size?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_size_preference")
    }
  }

  public var petSexPreference: Swift.Optional<[Sex?]?> {
    get {
      return graphQLMap["pet_sex_preference"] as? Swift.Optional<[Sex?]?> ?? Swift.Optional<[Sex?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_sex_preference")
    }
  }

  public var petSocialPreference: Swift.Optional<[Social?]?> {
    get {
      return graphQLMap["pet_social_preference"] as? Swift.Optional<[Social?]?> ?? Swift.Optional<[Social?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_social_preference")
    }
  }

  public var petTrainabilityPreference: Swift.Optional<[Trainability?]?> {
    get {
      return graphQLMap["pet_trainability_preference"] as? Swift.Optional<[Trainability?]?> ?? Swift.Optional<[Trainability?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_trainability_preference")
    }
  }

  public var petTypePreference: Swift.Optional<[`Type`?]?> {
    get {
      return graphQLMap["pet_type_preference"] as? Swift.Optional<[`Type`?]?> ?? Swift.Optional<[`Type`?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_type_preference")
    }
  }

  public var zipcode: Swift.Optional<String?> {
    get {
      return graphQLMap["zipcode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipcode")
    }
  }
}

public enum Experience: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case anExpert
  case experienced
  case aNovice
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AN_EXPERT": self = .anExpert
      case "EXPERIENCED": self = .experienced
      case "A_NOVICE": self = .aNovice
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .anExpert: return "AN_EXPERT"
      case .experienced: return "EXPERIENCED"
      case .aNovice: return "A_NOVICE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Experience, rhs: Experience) -> Bool {
    switch (lhs, rhs) {
      case (.anExpert, .anExpert): return true
      case (.experienced, .experienced): return true
      case (.aNovice, .aNovice): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Experience] {
    return [
      .anExpert,
      .experienced,
      .aNovice,
    ]
  }
}

public enum Sex: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MALE": self = .male
      case "FEMALE": self = .female
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "MALE"
      case .female: return "FEMALE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Sex, rhs: Sex) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Sex] {
    return [
      .male,
      .female,
    ]
  }
}

public enum `Type`: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case dog
  case cat
  case noPreference
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DOG": self = .dog
      case "CAT": self = .cat
      case "NO_PREFERENCE": self = .noPreference
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .dog: return "DOG"
      case .cat: return "CAT"
      case .noPreference: return "NO_PREFERENCE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: `Type`, rhs: `Type`) -> Bool {
    switch (lhs, rhs) {
      case (.dog, .dog): return true
      case (.cat, .cat): return true
      case (.noPreference, .noPreference): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [`Type`] {
    return [
      .dog,
      .cat,
      .noPreference,
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
        GraphQLField("pet_size_preference", type: .list(.scalar(Size.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(petSizePreference: [Size?]? = nil) {
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

      public var petSizePreference: [Size?]? {
        get {
          return resultMap["pet_size_preference"] as? [Size?]
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
        distance_to_user
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
        GraphQLField("distance_to_user", type: .scalar(Double.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(photos: [String?]? = nil, id: GraphQLID, name: String? = nil, age: Age, size: Size, petActivityValue: Activity? = nil, petDependencyValue: Dependency? = nil, petSocialValue: Social? = nil, petTrainabilityValue: Trainability? = nil, distanceToUser: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pet", "photos": photos, "id": id, "name": name, "age": age, "size": size, "pet_activity_value": petActivityValue, "pet_dependency_value": petDependencyValue, "pet_social_value": petSocialValue, "pet_trainability_value": petTrainabilityValue, "distance_to_user": distanceToUser])
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

      public var distanceToUser: Double? {
        get {
          return resultMap["distance_to_user"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "distance_to_user")
        }
      }
    }
  }
}

public final class GetAllLikedPetsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllLikedPets {
      likedPets {
        __typename
        pet {
          __typename
          photos
          id
          name
          age
          size
          distance_to_user
        }
      }
    }
    """

  public let operationName: String = "GetAllLikedPets"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likedPets", type: .nonNull(.list(.object(LikedPet.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likedPets: [LikedPet?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "likedPets": likedPets.map { (value: LikedPet?) -> ResultMap? in value.flatMap { (value: LikedPet) -> ResultMap in value.resultMap } }])
    }

    public var likedPets: [LikedPet?] {
      get {
        return (resultMap["likedPets"] as! [ResultMap?]).map { (value: ResultMap?) -> LikedPet? in value.flatMap { (value: ResultMap) -> LikedPet in LikedPet(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: LikedPet?) -> ResultMap? in value.flatMap { (value: LikedPet) -> ResultMap in value.resultMap } }, forKey: "likedPets")
      }
    }

    public struct LikedPet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LikedPet"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("pet", type: .nonNull(.object(Pet.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pet: Pet) {
        self.init(unsafeResultMap: ["__typename": "LikedPet", "pet": pet.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pet: Pet {
        get {
          return Pet(unsafeResultMap: resultMap["pet"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pet")
        }
      }

      public struct Pet: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Pet"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("photos", type: .list(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("age", type: .nonNull(.scalar(Age.self))),
          GraphQLField("size", type: .nonNull(.scalar(Size.self))),
          GraphQLField("distance_to_user", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(photos: [String?]? = nil, id: GraphQLID, name: String? = nil, age: Age, size: Size, distanceToUser: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pet", "photos": photos, "id": id, "name": name, "age": age, "size": size, "distance_to_user": distanceToUser])
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

        public var distanceToUser: Double? {
          get {
            return resultMap["distance_to_user"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance_to_user")
          }
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

public final class DislikePetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DislikePet($petId: ID!) {
      likePet(petId: $petId, isLiked: false) {
        __typename
        liked_at
      }
    }
    """

  public let operationName: String = "DislikePet"

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

public final class OnBoardMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation OnBoard($userOnboardingData: UserUpdateInput) {
      updateUser(user: $userOnboardingData) {
        __typename
        zipcode
      }
    }
    """

  public let operationName: String = "OnBoard"

  public var userOnboardingData: UserUpdateInput?

  public init(userOnboardingData: UserUpdateInput? = nil) {
    self.userOnboardingData = userOnboardingData
  }

  public var variables: GraphQLMap? {
    return ["userOnboardingData": userOnboardingData]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["user": GraphQLVariable("userOnboardingData")], type: .object(UpdateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.flatMap { (value: UpdateUser) -> ResultMap in value.resultMap }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (resultMap["updateUser"] as? ResultMap).flatMap { UpdateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("zipcode", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(zipcode: String) {
        self.init(unsafeResultMap: ["__typename": "User", "zipcode": zipcode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var zipcode: String {
        get {
          return resultMap["zipcode"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "zipcode")
        }
      }
    }
  }
}
