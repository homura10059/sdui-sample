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
                    let converted = val.data?.sections.map() { sections in
                        sections.map() { section in
                            Section(id: section.id)
                        }
                    }
                    continution.resume(returning: converted ?? [])

                case .failure(let error):
                    continution.resume(throwing: error)
                }
            }
        })
    }

}

