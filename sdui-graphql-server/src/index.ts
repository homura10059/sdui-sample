import { ApolloServer } from '@apollo/server'
import { startStandaloneServer } from '@apollo/server/standalone'
import { addMocksToSchema } from '@graphql-tools/mock'
import { makeExecutableSchema } from '@graphql-tools/schema'
import casual from 'casual'

import { readFileSync } from 'node:fs'
import type { SectionContainer } from './__generated__/graphql'

const typeDefs = readFileSync('./schema.graphql', { encoding: 'utf-8' })

const resolvers = {
  Query: {
    sections: () => 'dummy resolver for sections'
  }
}

const mocks = {
  SectionContainer: (): SectionContainer => ({
    id: casual.integer(1, 1000).toString(),
    sectionComponentType: casual.random_element([
      'TOPIC_CAROUSEL',
      'TOPIC_TRENDING'
    ]),
    section: {
      title: casual.title
    }
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
