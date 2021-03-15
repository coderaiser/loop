# Loop [![License][LicenseIMGURL]][LicenseURL] [![Dependency Status][DependencyStatusIMGURL]][DependencyStatusURL] [![Build Status][BuildStatusIMGURL]][BuildStatusURL]

[BuildStatusURL]:           https://travis-ci.org/coderaiser/loop  "Build Status"
[BuildStatusIMGURL]:        https://img.shields.io/travis/coderaiser/loop/master.svg?style=flat
[DependencyStatusIMGURL]:   https://david-dm.org/coderaiser/loop.svg?path=packages/putout
[DependencyStatusURL]:      https://david-dm.org/coderaiser/loop?path=packages/putout "Dependency Status"
[LicenseIMGURL]:            https://img.shields.io/badge/license-MIT-317BF9.svg?style=flat
[LicenseURL]:               https://tldrlegal.com/license/mit-license "MIT License"

Create or resize file system of an image file to use as a [loop device](https://en.wikipedia.org/wiki/Loop_device).

## Usage

```sh
docker run --rm coderaiser/loop <file> <size>
```

## Example

```sh
docker run --rm -t -v "$PWD:/root" --name loop coderaiser/loop image.bin 100M
```
You can pass arguments to docker container via environment variables `$FILE` and `$SIZE` as well:

```sh
docker run --rm -t -v "$PWD:/root" --name loop -e "FILE=image.bin" -e "SIZE=100M" coderaiser/loop
```

## License
MIT
