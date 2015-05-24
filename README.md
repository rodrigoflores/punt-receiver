# Punt::Receiver

Given a set of repos and a Github token, shows all the PRs.

![](https://travis-ci.org/rodrigoflores/punt-receiver.svg)

## Set up and usage

Install the gem:

```
gem install punt-receiver
```

Save your github OAuth token (with repo scope) on a env var named `GITHUB_TOKEN` and the full path of the config file on the env var `PR_REPOS_FILE`.

```
export GITHUB_TOKEN=a-token
export PR_REPOS_FILE=/users/flores/.pr.yaml
```

On the `PR_REPOS_FILE` you should put a yaml content like this:

```yaml
---
repos:
- rails/rails
- rspec/rspec
```

And then you'll be able to see all open PR's through the command

```
$ punt-receive
```

## To-do ##

- [ ] Create a set-up mode that checks for the env vars and creates a bare `PR_REPOS_FILE`;
- [ ] Align all PR fields;
- [ ] Be able to set what info will appear on the output;
