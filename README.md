# Loop [![License][LicenseIMGURL]][LicenseURL] [![Dependency Status][DependencyStatusIMGURL]][DependencyStatusURL] [![Build Status][BuildStatusIMGURL]][BuildStatusURL]

Create file system image file.

## Usage

```sh
docker run --rm coderaiser/loop <file> <size>
```

## Example

```sh
docker run --rm -t -v ~:/root coderaiser/loop image.bin 100M
```

## License
MIT

[BuildStatusIMGURL]:        https://img.shields.io/travis/coderaiser/loop/master.svg?style=flat
[DependencyStatusIMGURL]:   https://img.shields.io/gemnasium/coderaiser/loop.svg?style=flat
[LicenseIMGURL]:            https://img.shields.io/badge/license-MIT-317BF9.svg?style=flat
[BuildStatusURL]:           https://travis-ci.org/coderaiser/loop  "Build Status"
[DependencyStatusURL]:      https://gemnasium.com/coderaiser/loop "Dependency Status"
[LicenseURL]:               https://tldrlegal.com/license/mit-license "MIT License"

