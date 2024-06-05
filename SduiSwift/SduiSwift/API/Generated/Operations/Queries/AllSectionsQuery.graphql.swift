// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SduiSwift {
  class AllSectionsQuery: GraphQLQuery {
    static let operationName: String = "AllSections"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query AllSections { sections { __typename id sectionComponentType section { __typename ... on TopicSection { title items { __typename id label description imageUrl createdAt isDisabled } } } } }"#
      ))

    public init() {}

    struct Data: SduiSwift.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SduiSwift.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("sections", [Section]?.self),
      ] }

      var sections: [Section]? { __data["sections"] }

      /// Section
      ///
      /// Parent Type: `SectionContainer`
      struct Section: SduiSwift.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { SduiSwift.Objects.SectionContainer }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", SduiSwift.ID.self),
          .field("sectionComponentType", GraphQLEnum<SduiSwift.SectionComponentType>?.self),
          .field("section", Section?.self),
        ] }

        var id: SduiSwift.ID { __data["id"] }
        var sectionComponentType: GraphQLEnum<SduiSwift.SectionComponentType>? { __data["sectionComponentType"] }
        var section: Section? { __data["section"] }

        /// Section.Section
        ///
        /// Parent Type: `Section`
        struct Section: SduiSwift.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SduiSwift.Unions.Section }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsTopicSection.self),
          ] }

          var asTopicSection: AsTopicSection? { _asInlineFragment() }

          /// Section.Section.AsTopicSection
          ///
          /// Parent Type: `TopicSection`
          struct AsTopicSection: SduiSwift.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = AllSectionsQuery.Data.Section.Section
            static var __parentType: ApolloAPI.ParentType { SduiSwift.Objects.TopicSection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("title", String.self),
              .field("items", [Item].self),
            ] }

            var title: String { __data["title"] }
            var items: [Item] { __data["items"] }

            /// Section.Section.AsTopicSection.Item
            ///
            /// Parent Type: `Topic`
            struct Item: SduiSwift.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: ApolloAPI.ParentType { SduiSwift.Objects.Topic }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", SduiSwift.ID.self),
                .field("label", String.self),
                .field("description", String.self),
                .field("imageUrl", String.self),
                .field("createdAt", Int.self),
                .field("isDisabled", Bool.self),
              ] }

              var id: SduiSwift.ID { __data["id"] }
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