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
    id: casual.uuid,
    sectionComponentType: casual.random_element([
      'TOPIC_CAROUSEL',
      'TOPIC_TRENDING'
    ]),
    section: {
      __typename: 'TopicSection',
      title: casual.title,
      items: casual.array_of_digits(7).map(_ => ({
        id: casual.uuid,
        label: casual.word,
        description: casual.description,
        imageUrl: 'https://placehold.jp/150x150.png',
        createdAt: casual.unix_time,
        isDisabled: casual.boolean
      }))
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
