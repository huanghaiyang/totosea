String readTrendingDevelopers = """
  query ReadTrendingDevelopers(\$name: String!) {
    user(login: \$name) {
      id,
      name,
      login,
      avatarUrl,
      bio,
      company,
      companyHTML,
      location,
      url,
      viewerIsFollowing,
      viewerCanFollow,
      status {
        emoji,
        message,
      },
      repositories(first: 1, orderBy: {field: STARGAZERS, direction: DESC}, isFork: false) {
        nodes {
          name,
          description
        }
      } 
    }
  }
""";