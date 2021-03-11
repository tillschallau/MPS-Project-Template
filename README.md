# The JetBrains MPS Repository Template

This project provides a template for MPS project work environments. Including a .gitignore for MPS and a pipeline to automatically test your MPS projects in GitLab and GitHub.

To get the pipeline fully running with Nix:

## MPS Project Setup
You can add your new MPS Language project under the `src` folder so that the Nix setup is working correctly.

## GitHub Actions
1. Follow the first 2 steps of the tutorial: [Continuous Integration with GitHub Actions](https://nix.dev/tutorials/continuous-integration-github-actions.html)
2. Change [[yourcachename]] in `.github/workflows/nix-build.yml` to the name of your newly created cache