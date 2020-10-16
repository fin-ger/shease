#!/bin/sh

# adapted from https://gist.github.com/siddharthkrish/32072e6f97d7743b1a7c47d76d2cb06c

printf "Checking git for pending changes... " >&2
if [ "$(git status --porcelain | wc -l)" -gt 0 ]
then
    printf "not clean - aborting\n" >&2
    exit 1
fi
printf "clean\n"

semver="$1"
major=0
minor=0
patch=0
old_version="${semver}"

IFS='.' read -r major minor patch <<EOF
${semver}
EOF

while true
do
    printf "Please specify part to increment [major|minor|patch]: " >&2
    read -r ans
    case "${ans}" in
        major|majo|maj|ma)
            major=$((major + 1))
            break
            ;;
        minor|mino|min|mi)
            minor=$((minor + 1))
            break
            ;;
        patch|patc|pat|pa|p)
            patch=$((patch + 1))
            break
            ;;
        *)
            printf "Invalid selection '%s'. Please try again!\n" "${ans}" >&2
            ;;
    esac
done

semver="${major}.${minor}.${patch}"

while true
do
    printf "Update version to %s? [y/N] " "${semver}" >&2
    read -r ans

    case "${ans}" in
        y|Y)
            break
            ;;
        n|N)
            printf "Aborting...\n"
            exit 2
            ;;
        *)
            printf "Please answer 'y' or 'n'.\n"
            ;;
    esac
done

printf "Updating version to %s...\n" "${semver}" >&2

sed -i -e "s;VERSION=.*;VERSION=v${semver};g" Makefile .github/workflows/release.yml

make package

git add -A
git commit -s -m "(make-release) Update version from ${old_version} to ${semver}"
git push origin main:main

git tag -sm "Update version to ${semver}" "v${semver}"
git push --tags
