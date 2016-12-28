# Sagacity

Sagacity is an indispensible tool chain for sagacious coders.

Among its features it includes:

## Installing

```shell
curl https://raw.github.com/gabrielfalcao/sagacity/master/install.sh | bash
```

## Updating

It's easy to update sagacity and get the newest plugins, just run in
your bash:

```shell
sagacity.update
```

## Dropbox backup of projects

* Leveraging a project structure divided within categories "work",
"personal" and "3rdparty".

* All the projects are backed up by Dropbox: Imagine your git
repositories being backed up instantaniously in the cloud ? No
more chaos when you accidentally "git reset --hard" on the code
you've been working in the past hours.

* Go to your dropbox account and recover any "deleted" files and
you're safe :)

## Modular structure

Plugin-based, `sagacity` is easy to extend; You can fork this project,
add your own plugins and send a pull request.

## Customizable

Want to write a "private" plugin ? Don't worry, you can add files
under `$HOME/.sagacity/extensions` and they will be bootstrapped


## It comes with some plugins:

### Virtualenv wrapper hooks

Make your venvs more intelligent

### Service manager

It manages services for you, forget LaunchAgents and use something like:

```shell
service-status
service-start redis
service-stop mysql
```


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/gabrielfalcao/sagacity/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

