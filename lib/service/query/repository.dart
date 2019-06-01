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
          languages(first: 10) {
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
          isFork
        }
      }
    }
  }
""";