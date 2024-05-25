import { client } from '@/lib/micro-cms-client'

type Section = {
  fieldId: 'section'
  type: 'TITLE'
  text: 'sample title'
}

type Sections = {
  sections: Section[]
}

export default async function Home() {
  const sections = await client.getObject<Sections>({ endpoint: 'sections' })
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      {sections.sections.map(section => {
        /* biome-ignore lint/correctness/useJsxKeyInIterable: <explanation> */
        return <h1>{section.text}</h1>
      })}
    </main>
  )
}
