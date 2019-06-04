String readTrendingRepositories = """
  query readTrendingRepositories(\$owner: String!, \$name: String!) {
      repository(owner: \$owner, name: \$name) {
        id,
        name,
        viewerHasStarred,
        description,
        descriptionHTML,
        resourcePath,
        projectsResourcePath,
        nameWithOwner,
        languages(first: 10, orderBy: {field: SIZE, direction: DESC}) {
          nodes {
            color,
            id,
            name
          },
        },
        owner {
          id,
          login,
          avatarUrl
        },
        forkCount,
        isFork,
        stargazers(first: 10, orderBy: {field: STARRED_AT, direction: DESC}){
          totalCount,
        },
        collaborators(first: 5) {
          totalCount,
          nodes {
            avatarUrl,
            id,
            login,
          },
        }
        mentionableUsers(first: 5) {
          totalCount,
          nodes {
            avatarUrl,
            id,
            login,
          },
        }
      }
    },
""";