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
