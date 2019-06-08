String readRepository = """
  query readRepository(\$name: String!, \$owner: String!) {
    repository(name: \$name, owner: \$owner){
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
      watchers {
        totalCount,
      },
      primaryLanguage{
        name,
        color,
        id
      },
      licenseInfo{
        name,
        id,
      },
      diskUsage,
      defaultBranchRef{
        name,
        id,
      },
      pullRequests(states: OPEN, labels: ""){
        totalCount
      },
      issues{
        totalCount
      },
      updatedAt,
      releases{
        totalCount,
      },
      labels(first: 0){
        nodes {
          color,
          description,
          name,
        },
        totalCount
      },
      commitComments{
        totalCount
      }
    }
  }
""";