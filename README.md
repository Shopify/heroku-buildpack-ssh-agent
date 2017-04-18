# heroku-buildpack-ssh-agent

Heroku buildpack to let you add an SSH private key to an heroku app's built dyno, and runs an ssh-agent process there, so it can access SSH secured resources, say through something like [Signpost](https://github.com/shopify/signpost).

### Installation

The key have to be stored in the application's env:

```bash
heroku config:set SSH_KEY="-----BEGIN RSA PRIVATE KEY-----...."
```

This buildpack will also look for a config var named `GITHUB_DEPLOY_KEY` to match https://github.com/Shopify/heroku-buildpack-git-deploy-keys.

Then you have to install this buildpack on your app: [Instructions](https://devcenter.heroku.com/articles/platform-api-reference#buildpack-installations)

### Development / Testing

A great way to test is using Heroku's buildpack test runner. See https://github.com/heroku/heroku-buildpack-testrunner. To set up, run these commands:
```
heroku create --buildpack https://github.com/heroku/heroku-buildpack-testrunner
git push heroku master
```
