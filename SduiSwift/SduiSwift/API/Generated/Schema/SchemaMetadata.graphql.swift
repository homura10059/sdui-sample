// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol SduiSwift_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SduiSwift.SchemaMetadata {}

protocol SduiSwift_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SduiSwift.SchemaMetadata {}

protocol SduiSwift_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SduiSwift.SchemaMetadata {}

protocol SduiSwift_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SduiSwift.SchemaMetadata {}

extension SduiSwift {
  typealias SelectionSet = SduiSwift_SelectionSet

  typealias InlineFragment = SduiSwift_InlineFragment

  typealias MutableSelectionSet = SduiSwift_MutableSelectionSet

  typealias MutableInlineFragment = SduiSwift_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return SduiSwift.Objects.Query
      case "SectionContainer": return SduiSwift.Objects.SectionContainer
      case "TopicSection": return SduiSwift.Objects.TopicSection
      case "Topic": return SduiSwift.Objects.Topic
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}