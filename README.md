<h1 align="center">Welcome to Shease 🧀</h1>
<p align="center">
  <a href="https://github.com/fin-ger/shease/actions?query=workflow%3A%22latest%20build%22">
    <img src="https://github.com/fin-ger/shease/workflows/latest%20build/badge.svg" alt="latest build">
  </a>
  <a href="https://github.com/fin-ger/shease/actions?query=workflow%3A%22release%20build%22">
    <img src="https://github.com/fin-ger/shease/workflows/release%20build/badge.svg" alt="release build">
  </a>
  <a href="https://github.com/fin-ger/shease/releases">
    <img alt="Lastest release" src="https://img.shields.io/github/v/release/fin-ger/shease?label=latest%20release&sort=semver">
  </a>
  <a href="https://github.com/fin-ger/shease/blob/master/LICENSE">
    <img alt="GitHub" src="https://img.shields.io/github/license/fin-ger/shease.svg">
  </a>
  <a href="http://spacemacs.org">
    <img src="https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg" />
  </a>
  <a href="http://makeapullrequest.com">
    <img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg">
  </a>
  <br>
  <i>A POSIX compatible shell script library and tool for number sequences with easing functions.</i>
</p>

---

Shease creates number sequences which can be interpolated with a set of easing
functions.

## How does it look like?

<details>
  <summary>Expand to view</summary>
  <img src="assets/demo.gif" alt="shease demo">
</details>

## Installation

The easiest way to install Shease is to clone this repository and use Make to install it to your local user:

```
$ git clone https://github.com/fin-ger/shease.git
$ cd shease
$ PREFIX=~/.local make install
```

As an alternative you can download a pre-packaged tarball from the releases section with `/usr` configured as the installation prefix. Extract this tarball to `/usr` and your good to go!

```
$ cd /usr
$ tar xf /path/to/shease-0.1.0.tgz
```

> Note: The pre-packaged tarball only works with the `/usr` installation prefix. If you prefer a different location, build your own tarball or use the Make installation from above.

## Usage

Shease can be used in 2 different ways: as a sourcable shell script library or as a command-line application.

### Tool

When successfully installed, you can type

```
$ shease --help
```

to get a detailed explanation on what easing functions are available and how to use them.

To launch the demo, run

```
$ shease-demo
```

### Library

You can use all Shease functions by simply sourcing `src/shease.rc`. Look into the source code to find documentation on how to use each function.

## Troubleshooting

If you find any bugs/unexpected behaviour or you have a proposition for future changes open an issue describing the current behaviour and what you expected.

## Development

The development of Shease is centered around the Makefile. The basic workflow consist of applying some changes to the code and running

```
$ make dev-install
$ shease my-command ...
```

to test your changes.

### Creating a Release

A Shease release can be created by running

```
$ make release
```

Follow the instructions to finish the release.

## Authors

**Fin Christensen**

> [:octocat: `@fin-ger`](https://github.com/fin-ger)  
> [:elephant: `@fin_ger@weirder.earth`](https://weirder.earth/@fin_ger)  
