import Foundation

public struct Section: Hashable {
    var title: String
    var componentType: ComponentType
}

enum ComponentType: String, EnumType {
    case topicCarousel = "TOPIC_CAROUSEL"
    case topicTrending = "TOPIC_TRENDING"
}

extension ComponentType {
    init(from: GraphQLEnum<GraphqlAPI.SectionComponentType>) {
        switch from {
        case .topicCarousel:
            self = .topicCarousel
        case .topicTrending:
            self = .topicTrending
        case .case(_):
            self = .topicCarousel
        case .unknown(_):
            self = .topicCarousel
        }
    }
}
