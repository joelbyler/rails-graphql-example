# CleRb GraphQL sample app

**Slides**: https://docs.google.com/presentation/d/1hjau6Dp5bmBZ--G8ctIxTmO_heLVaSYuHBS0F-zI4fI/edit?usp=sharing

**REF**: https://www.howtographql.com/graphql-ruby/

## Sample queries

**Sign a user in and retrieve an auth token (using dev seeds)**
```
mutation {
  signinUser(email:{
    email: "jose@example.com",
    password:  "abcdef"
  }) {
    token
    user {
      id
    }
  }
}
```

query a link
```
query {
  allLinks(filter:{captionContains:"example"}) {
    caption
  }
}
```

create a new link
```
mutation {
  createLink(url:"tester", caption:"testerson") {
    id
  }
}
```

**Links and the votes for them**
```
query {
  allLinks{
    url
    caption
    votes {
      user {
        name
      }
    }
  }
}
```


## MOAR Examples
```
query {
  __schema {
    types {
      name
      description
      fields {
        name
        description
      }
    }
  }
}

# query {
#   allLinks {
#     url
#     caption
#   }
# }

# mutation {
#   createVote(linkId:"3") {
#     link {
#       caption
#     }
#     user {
#       name
#     }
#   }
# }

# query {
#   allLinks {
#     url
#     caption
#     votes {
#       id
#       user {
#         email
#       }
#     }
#   }
# }

# mutation {
#   createLink(url:"http://meetup.com", caption:"great place to meet great folks") {
#     id
#   }
# }

# query {
#   filterLinks(filter:{captionContains:"meet"}) {
#     url
#     caption
#   }
# }

# query {
#   filterLinks(
#     filter: {
#       captionContains: "graph",
#       OR: [{
#       	urlContains: "meet",
#         OR: {
#           urlContains: "up"
#         }
#       }, {
#             captionContains: "ruby"
#       }]
#     }) {
#     url
#     caption
#   }
# }

# mutation {
#   signinUser(email:{
#     email: "jose@example.com",
#     password:  "abcdef"
#   }) {
#     token
#     user {
#       id
#     }
#   }
# }
