
# Consumer-Driven Contracts with GraphQL Faker and GraphQL Contract Test

## GraphQL Faker
**From**: <https://github.com/APIs-guru/graphql-faker>

Mock your future API or extend the existing API with realistic data from [faker.js](https://github.com/Marak/faker.js). __No coding required__.
All you need is to write [GraphQL IDL](https://blog.graph.cool/graphql-sdl-schema-definition-language-6755bcb9ce51). Don't worry, we will provide you with examples in our IDL editor.

In the GIF bellow we add fields to types inside real GitHub API and you can make queries from GraphiQL, Apollo, Relay, etc. and receive __real data mixed with mock data.__

### How does it work?

We use `@fake` directive to let you specify how to fake data. And if 60+ fakers is not enough for you, just use `@examples` directive to provide examples. Just add a directive to any field or custom scalar definition:

```graphql
type Person {
    name: String @fake(type: firstName)
    gender: String @examples(values: ["male", "female"])
}
```

No need to remember or read any docs. Autocompletion is included!

### Features

+ 60+ different types of faked data e.g. `streetAddress`, `firstName`, `lastName`, `imageUrl`, `lorem`, `semver`
+ Comes with multiple locales supported
+ Runs as a local server (can be called from browser, cURL, your app, etc.)
+ Interactive editor with autocompletion for directives with GraphiQL embeded
+ ✨ Support for proxying existing GraphQL API and extending it with faked data
![Extend mode diagram](./docs/extend-mode.gif)

### Install

    npm install -g graphql-faker
or

    yarn global add graphql-faker

or run it in a Docker container, see **Usage with Docker**

### TL;DR

Mock GraphQL API based on example IDL and open interactive editor:

    graphql-faker --open

__Note:__ You can specify non-existing IDL file names - Faker will use example IDL which you can edit in interactive editor.

Extend real data from SWAPI with faked data based on extension IDL:

```bash
graphql-faker ./ext-swapi.grqphql --extend http://swapi.apis.guru
```

Extend real data from GitHub API with faked data based on extension IDL (you can get token [here](https://developer.github.com/early-access/graphql/guides/accessing-graphql/#generating-an-oauth-token)):

```bash
graphql-faker ./ext-gh.graphql --extend https://api.github.com/graphql \
--header "Authorization: bearer <TOKEN>"
```

### Usage

```bash
graphql-faker [options] [IDL file]
```

`[IDL file]` - path to file with [IDL](https://www.graph.cool/docs/faq/graphql-schema-definition-idl-kr84dktnp0/). If this argument is omited Faker uses default file name.

#### Options

 * `-p`, `--port`          HTTP Port [default: `env.PORT` or `9002`]
 * `-e`, `--extend`        URL to existing GraphQL server to extend
 * `-o`, `--open`          Open page with IDL editor and GraphiQL in browser
 * `-H`, `--header`        Specify headers to the proxied server in cURL format, e.g.: `Authorization: bearer XXXXXXXXX`
 * `--forward-headers`     Specify which headers should be forwarded to the proxied server
 * `--co`, `--cors-origin` CORS: Specify the origin for the Access-Control-Allow-Origin header
 * `-h`, `--help`          Show help
 
When specifying the `[SDL file]` after the `--forward-headers` option you need to prefix it with `--` to clarify it's not another header. For example:

```bash
graphql-faker --extend http://example.com/graphql --forward-headers Authorition -- ./temp.faker.graphql
```

When you finish with an other option there is no need for the `--`:

```bash
graphql-faker --forward-headers Authorition --extend http://example.com/graphql ./temp.faker.graphql
```

#### Usage with Docker

To specify a custom file, mount a volume where the file is located to `/workdir`:

```bash
docker run \
--rm \
--name graphql-faker \
-p 9002:9002 \
-v $PWD:/workdir \
apisguru/graphql-faker \
example.graphql
```

Because the process is running inside of the container, `--open` does not work.

### Development

```bash
yarn
npm run build:all
npm run start
```

---

## GraphQL Contract Test
**From**: <https://github.com/symm/graphql-contract-test>

Consumer driven contract testing for GraphQL APIs.

### Usage

```text
  GraphQL Contract Test v0.0.10


  Check if the remote server fulfills the supplied GraphQL contract file

  Usage: graphql-contract-test ENDPOINT_URL client_schema_file

  Options:
    --header, -h         Add a custom header (ex. 'Authorization=Bearer ...'), can be used multiple times
    --ignore-directives  Exclude directive changes from the comparison
```

Where `client-schema.graphql` contains the schema you expect the server to implement.

An [introspection query](http://graphql.org/learn/introspection/) will be made against the API, any breaking changes will be reported

### Docker Image

Place your `schema.graphqls` file in the current working directory then exec:

```bash
docker run \
    --rm \
    --name graphql-contract-test \
    -t \
    -v /$PWD/example.graphql:/example.graphql \
    symm/graphql-contract-test:latest \
    http://mac-asantos.local:9002/graphql \
    /example.graphql
```

## References

* [GraphQL Faker](https://github.com/APIs-guru/graphql-faker)
* [GraphQL Contract Test](https://github.com/symm/graphql-contract-test)
* [Consumer-Driven Contracts: A Service Evolution Pattern](https://www.martinfowler.com/articles/consumerDrivenContracts.html)
* [faker.js](https://github.com/marak/Faker.js/)
* [eslint-plugin-graphql](https://github.com/apollographql/eslint-plugin-graphql)
* [Testing a GraphQL Server](https://medium.com/@FdMstri/testing-a-graphql-server-13512408c2fb)
* [Our GraphQL Experience](https://medium.com/sainsburys-engineering/our-graphql-experience-a8bf511341a2)
* [Contract testing a GraphQL API](http://blog.pact.io/2018/07/24/contract-testing-a-graphql-api/)
* [Mocking your server is easy with GraphQL](https://graphql.org/blog/mocking-with-graphql/)
* [ContractTest](https://martinfowler.com/bliki/ContractTest.html)
* [Why We’re Betting on GraphQL](https://engineering.universe.com/why-were-betting-on-graphql-233ddf1a0779)
* 

🍺 Enjoy!!