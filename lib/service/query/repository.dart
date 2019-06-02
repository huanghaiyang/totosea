String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!) {
    viewer {
      repositories(last: \$nRepositories) {
        nodes {
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
          }
        }
      }
    }
  }
""";