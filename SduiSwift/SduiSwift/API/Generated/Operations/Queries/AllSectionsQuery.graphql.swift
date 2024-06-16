// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphqlAPI {
  class AllSectionsQuery: GraphQLQuery {
    static let operationName: String = "AllSections"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query AllSections { sections { __typename id sectionComponentType section { __typename ... on TopicSection { title items { __typename id label description imageUrl createdAt isDisabled } } } } }"#
      ))

    public init() {}

    struct Data: GraphqlAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("sections", [Section].self),
      ] }

      var sections: [Section] { __data["sections"] }

      /// Section
      ///
      /// Parent Type: `SectionContainer`
      struct Section: GraphqlAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.SectionContainer }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", GraphqlAPI.ID.self),
          .field("sectionComponentType", GraphQLEnum<GraphqlAPI.SectionComponentType>?.self),
          .field("section", Section?.self),
        ] }

        var id: GraphqlAPI.ID { __data["id"] }
        var sectionComponentType: GraphQLEnum<GraphqlAPI.SectionComponentType>? { __data["sectionComponentType"] }
        var section: Section? { __data["section"] }

        /// Section.Section
        ///
        /// Parent Type: `Section`
        struct Section: GraphqlAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Unions.Section }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsTopicSection.self),
          ] }

          var asTopicSection: AsTopicSection? { _asInlineFragment() }

          /// Section.Section.AsTopicSection
          ///
          /// Parent Type: `TopicSection`
          struct AsTopicSection: GraphqlAPI.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = AllSectionsQuery.Data.Section.Section
            static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.TopicSection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("title", String.self),
              .field("items", [Item].self),
            ] }

            var title: String { __data["title"] }
            var items: [Item] { __data["items"] }

            /// Section.Section.AsTopicSection.Item
            ///
            /// Parent Type: `Topic`
            struct Item: GraphqlAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.Topic }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", GraphqlAPI.ID.self),
                .field("label", String.self),
                .field("description", String.self),
                .field("imageUrl", String.self),
                .field("createdAt", Int.self),
                .field("isDisabled", Bool.self),
              ] }

              var id: GraphqlAPI.ID { __data["id"] }
              var label: String { __data["label"] }
              var description: String { __data["description"] }
              var imageUrl: String { __data["imageUrl"] }
              var createdAt: Int { __data["createdAt"] }
              var isDisabled: Bool { __data["isDisabled"] }
            }
          }
        }
      }
    }
  }

}