matz = User.create name: 'matz', email: 'matz@example.com', password: '123456'
tenderlove = User.create name: 'tenderlove', email: 'tenderlove@example.com', password: 'catcat'
jose = User.create name: 'jose', email: 'jose@example.com', password: 'abcdef'

clerb = Link.create url: 'https://clevelandrb.com/', caption: 'Best meetup in CLE', user: matz
graphql = Link.create url: 'http://graphql.org/', caption: 'The Best Query Language', user: tenderlove
apollo = Link.create url: 'http://dev.apollodata.com/', caption: 'Awesome GraphQL Client', user: jose

Vote.create(user: matz, link: clerb)
Vote.create(user: tenderlove, link: clerb)
Vote.create(user: jose, link: clerb)

Vote.create(user: tenderlove, link: graphql)
Vote.create(user: jose, link: graphql)

Vote.create(user: tenderlove, link: apollo)
