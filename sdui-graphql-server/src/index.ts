import { ApolloServer } from '@apollo/server'
import { startStandaloneServer } from '@apollo/server/standalone'
import { addMocksToSchema } from '@graphql-tools/mock'
import { makeExecutableSchema } from '@graphql-tools/schema'
import casual from 'casual'

import { readFileSync } from 'node:fs'

const typeDefs = readFileSync('./schema.graphql', { encoding: 'utf-8' })

// const typeDefs = `#graphql
// type Query {
//   sections: [SectionContainer!]
// }
//
// type SectionContainer {
//   id: ID!
//   sectionComponentType: SectionComponentType
//   #  section: Section
// }
//
// enum SectionComponentType {
//   TOPIC_CAROUSEL
//   TOPIC_TRENDING
// }
//
// #union Section = TopicSection
// #
// #type TopicSection {
// #  title: String!
// #  items: [Topic!]!
// #}
// #
// #type Topic {
// #  id: ID!
// #  label: String!
// #  description: String!
// #  imageUrl: String!
// #  createdAt: Int!
// #  isDisabled: Boolean!
// #}
// `

const resolvers = {
  Query: {
    sections: () => 'dummy resolver for sections'
  }
}

const mocks = {
  SectionContainer: () => ({
    id: casual.integer(1, 1000),
    sectionComponentType: casual.random_element([
      'TOPIC_CAROUSEL',
      'TOPIC_TRENDING'
    ])
  })
}

const server = new ApolloServer({
  schema: addMocksToSchema({
    schema: makeExecutableSchema({ typeDefs, resolvers }),
    mocks
  })
})

const { url } = await startStandaloneServer(server, { listen: { port: 4000 } })

console.log(`🚀 Server listening at: ${url}`)
