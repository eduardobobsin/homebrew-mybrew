# homebrew-mybrew

Eduardo's [mybrew](https://github.com/eduardobobsin/mybrew) instance: Homebrew bottles for
Intel Macs on macOS Sequoia, built on demand for formulae that no longer ship one.

## Use

```bash
brew tap eduardobobsin/mybrew
brew trust --tap eduardobobsin/mybrew
brew install eduardobobsin/mybrew/mybrew   # the client

mybrew install <formula>   # builds a bottle on GitHub first if there is none
```

## Add a formula

Actions → **Build bottle** → Run workflow → enter a `homebrew/core` formula name.

The workflow copies the formula from homebrew-core (checksum-verified), builds it on
`macos-15-intel`, uploads the bottle to S3 (`mybrew-bottles`, via GitHub OIDC) and commits
`Formula/<formula>.rb` with a matching `bottle do` block.
