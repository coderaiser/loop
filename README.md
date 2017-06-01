# Loop [![License][LicenseIMGURL]][LicenseURL] [![Dependency Status][DependencyStatusIMGURL]][DependencyStatusURL] [![Build Status][BuildStatusIMGURL]][BuildStatusURL]

Create or resize file system of an image file to use as a [loop device](https://en.wikipedia.org/wiki/Loop_device).

## Usage

```sh
docker run --rm coderaiser/loop <file> <size>
```

## Example

```sh
docker run --rm -t -v ~:/root --name loop coderaiser/loop image.bin 100M
```
You can pass arguments to docker container via environment variables `$FILE` and `$SIZE` as well:

```sh
docker run --rm -t -v ~:/root --name loop -e "FILE=image.bin" -e "SIZE=100M" coderaiser/loop
```


## License
MIT

[BuildStatusIMGURL]:        https://img.shields.io/travis/coderaiser/loop/master.svg?style=flat
[DependencyStatusIMGURL]:   https://img.shields.io/gemnasium/coderaiser/loop.svg?style=flat
[LicenseIMGURL]:            https://img.shields.io/badge/license-MIT-317BF9.svg?style=flat
[BuildStatusURL]:           https://travis-ci.org/coderaiser/loop  "Build Status"
[DependencyStatusURL]:      https://gemnasium.com/coderaiser/loop "Dependency Status"
[LicenseURL]:               https://tldrlegal.com/license/mit-license "MIT License"

