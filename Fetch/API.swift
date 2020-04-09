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

public struct UserCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
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
  public init(petActivityPreference: Swift.Optional<ACTIVITY?> = nil, petAgePreference: Swift.Optional<AGE?> = nil, petDependencyPreference: Swift.Optional<DEPENDENCY?> = nil, petDistancePreference: Swift.Optional<Int?> = nil, petExperienceLevel: Swift.Optional<EXPERIENCE?> = nil, petGoodWithChildrenPreference: Swift.Optional<Bool?> = nil, petGoodWithDogsPreference: Swift.Optional<Bool?> = nil, petGoodWithCatsPreference: Swift.Optional<Bool?> = nil, petSizePreference: Swift.Optional<SIZE?> = nil, petSexPreference: Swift.Optional<SEX?> = nil, petSocialPreference: Swift.Optional<SOCIAL?> = nil, petTrainabilityPreference: Swift.Optional<TRAINABILITY?> = nil, petTypePreference: Swift.Optional<TYPE?> = nil, zipcode: String) {
    graphQLMap = ["pet_activity_preference": petActivityPreference, "pet_age_preference": petAgePreference, "pet_dependency_preference": petDependencyPreference, "pet_distance_preference": petDistancePreference, "pet_experience_level": petExperienceLevel, "pet_good_with_children_preference": petGoodWithChildrenPreference, "pet_good_with_dogs_preference": petGoodWithDogsPreference, "pet_good_with_cats_preference": petGoodWithCatsPreference, "pet_size_preference": petSizePreference, "pet_sex_preference": petSexPreference, "pet_social_preference": petSocialPreference, "pet_trainability_preference": petTrainabilityPreference, "pet_type_preference": petTypePreference, "zipcode": zipcode]
  }

  public var petActivityPreference: Swift.Optional<ACTIVITY?> {
    get {
      return graphQLMap["pet_activity_preference"] as? Swift.Optional<ACTIVITY?> ?? Swift.Optional<ACTIVITY?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_activity_preference")
    }
  }

  public var petAgePreference: Swift.Optional<AGE?> {
    get {
      return graphQLMap["pet_age_preference"] as? Swift.Optional<AGE?> ?? Swift.Optional<AGE?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_age_preference")
    }
  }

  public var petDependencyPreference: Swift.Optional<DEPENDENCY?> {
    get {
      return graphQLMap["pet_dependency_preference"] as? Swift.Optional<DEPENDENCY?> ?? Swift.Optional<DEPENDENCY?>.none
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

  public var petExperienceLevel: Swift.Optional<EXPERIENCE?> {
    get {
      return graphQLMap["pet_experience_level"] as? Swift.Optional<EXPERIENCE?> ?? Swift.Optional<EXPERIENCE?>.none
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

  public var petSizePreference: Swift.Optional<SIZE?> {
    get {
      return graphQLMap["pet_size_preference"] as? Swift.Optional<SIZE?> ?? Swift.Optional<SIZE?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_size_preference")
    }
  }

  public var petSexPreference: Swift.Optional<SEX?> {
    get {
      return graphQLMap["pet_sex_preference"] as? Swift.Optional<SEX?> ?? Swift.Optional<SEX?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_sex_preference")
    }
  }

  public var petSocialPreference: Swift.Optional<SOCIAL?> {
    get {
      return graphQLMap["pet_social_preference"] as? Swift.Optional<SOCIAL?> ?? Swift.Optional<SOCIAL?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_social_preference")
    }
  }

  public var petTrainabilityPreference: Swift.Optional<TRAINABILITY?> {
    get {
      return graphQLMap["pet_trainability_preference"] as? Swift.Optional<TRAINABILITY?> ?? Swift.Optional<TRAINABILITY?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_trainability_preference")
    }
  }

  public var petTypePreference: Swift.Optional<TYPE?> {
    get {
      return graphQLMap["pet_type_preference"] as? Swift.Optional<TYPE?> ?? Swift.Optional<TYPE?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pet_type_preference")
    }
  }

  public var zipcode: String {
    get {
      return graphQLMap["zipcode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipcode")
    }
  }
}

public enum ACTIVITY: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: ACTIVITY, rhs: ACTIVITY) -> Bool {
    switch (lhs, rhs) {
      case (.aCouchPotato, .aCouchPotato): return true
      case (.active, .active): return true
      case (.anAthlete, .anAthlete): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ACTIVITY] {
    return [
      .aCouchPotato,
      .active,
      .anAthlete,
    ]
  }
}

public enum AGE: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: AGE, rhs: AGE) -> Bool {
    switch (lhs, rhs) {
      case (.young, .young): return true
      case (.adult, .adult): return true
      case (.senior, .senior): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AGE] {
    return [
      .young,
      .adult,
      .senior,
    ]
  }
}

public enum DEPENDENCY: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: DEPENDENCY, rhs: DEPENDENCY) -> Bool {
    switch (lhs, rhs) {
      case (.independent, .independent): return true
      case (.somewhatDependent, .somewhatDependent): return true
      case (.dependent, .dependent): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DEPENDENCY] {
    return [
      .independent,
      .somewhatDependent,
      .dependent,
    ]
  }
}

public enum EXPERIENCE: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: EXPERIENCE, rhs: EXPERIENCE) -> Bool {
    switch (lhs, rhs) {
      case (.anExpert, .anExpert): return true
      case (.experienced, .experienced): return true
      case (.aNovice, .aNovice): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [EXPERIENCE] {
    return [
      .anExpert,
      .experienced,
      .aNovice,
    ]
  }
}

public enum SIZE: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: SIZE, rhs: SIZE) -> Bool {
    switch (lhs, rhs) {
      case (.small, .small): return true
      case (.medium, .medium): return true
      case (.large, .large): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SIZE] {
    return [
      .small,
      .medium,
      .large,
    ]
  }
}

public enum SEX: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: SEX, rhs: SEX) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SEX] {
    return [
      .male,
      .female,
    ]
  }
}

public enum SOCIAL: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case aWallflower
  case social
  case lifeOfTheParty
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "A_WALLFLOWER": self = .aWallflower
      case "SOCIAL": self = .social
      case "LIFE_OF_THE_PARTY": self = .lifeOfTheParty
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .aWallflower: return "A_WALLFLOWER"
      case .social: return "SOCIAL"
      case .lifeOfTheParty: return "LIFE_OF_THE_PARTY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: SOCIAL, rhs: SOCIAL) -> Bool {
    switch (lhs, rhs) {
      case (.aWallflower, .aWallflower): return true
      case (.social, .social): return true
      case (.lifeOfTheParty, .lifeOfTheParty): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [SOCIAL] {
    return [
      .aWallflower,
      .social,
      .lifeOfTheParty,
    ]
  }
}

public enum TRAINABILITY: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: TRAINABILITY, rhs: TRAINABILITY) -> Bool {
    switch (lhs, rhs) {
      case (.classClown, .classClown): return true
      case (.attentiveStudent, .attentiveStudent): return true
      case (.teachersPet, .teachersPet): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TRAINABILITY] {
    return [
      .classClown,
      .attentiveStudent,
      .teachersPet,
    ]
  }
}

public enum TYPE: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
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

  public static func == (lhs: TYPE, rhs: TYPE) -> Bool {
    switch (lhs, rhs) {
      case (.dog, .dog): return true
      case (.cat, .cat): return true
      case (.noPreference, .noPreference): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TYPE] {
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
    mutation Login($auth: AuthInput!, $userOnboardingData: UserCreateInput!) {
      createUser(auth: $auth, user: $userOnboardingData) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "Login"

  public var auth: AuthInput
  public var userOnboardingData: UserCreateInput

  public init(auth: AuthInput, userOnboardingData: UserCreateInput) {
    self.auth = auth
    self.userOnboardingData = userOnboardingData
  }

  public var variables: GraphQLMap? {
    return ["auth": auth, "userOnboardingData": userOnboardingData]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["auth": GraphQLVariable("auth"), "user": GraphQLVariable("userOnboardingData")], type: .object(CreateUser.selections)),
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

public final class UserIsOnboardedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserIsOnboarded {
      currentUser {
        __typename
        pet_size_preference
      }
    }
    """

  public let operationName: String = "UserIsOnboarded"

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
        GraphQLField("pet_size_preference", type: .scalar(SIZE.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(petSizePreference: SIZE? = nil) {
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

      public var petSizePreference: SIZE? {
        get {
          return resultMap["pet_size_preference"] as? SIZE
        }
        set {
          resultMap.updateValue(newValue, forKey: "pet_size_preference")
        }
      }
    }
  }
}
