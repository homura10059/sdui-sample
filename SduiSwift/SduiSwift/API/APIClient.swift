import Apollo
import Foundation


public final class APIClient {

    public let apollo: ApolloClient

    public init(endpointURL: String) {
        // setup apollo client
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: endpointURL)!
        )
        apollo = ApolloClient(networkTransport: transport, store: store)
    }

    @available(iOS 13.0.0, *)
    public func allSections() async throws -> [Section] {
        try await withCheckedThrowingContinuation({ continution in
            apollo.fetch(query: GraphqlAPI.AllSectionsQuery()) { result in
                switch result {
                case .success(let val):
                    guard let data = val.data else {
                        continution.resume(returning: [])
                        return
                    }

                    let sections = data.sections.compactMap { item in
                        item.section?.asTopicSection
                    } .map() { topic in
                        Section(title: topic.title)
                    }
                    continution.resume(returning: sections)

                case .failure(let error):
                    continution.resume(throwing: error)
                }
            }
        })
    }

}

