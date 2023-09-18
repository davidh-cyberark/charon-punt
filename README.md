# Migrate HC Vault KV to CyberArk PAS Vault

Update: <Wed Sep 13 18:01:40 CDT 2023>

## Introduction

* TODO: What is this?
* TODO: What will this help you to do?

### THIS IS A DRAFT IMPLEMENTATION 

This impelementation will help to show what is possible to get the secrets from HC Vault to PAS Vault.

## Quick Start

1. In PAS UI (aka PVWA):
   1. Go to "Administration" -> "Platform Management", then expand the "Unix" platform.
   2. Duplicate the "Unix via SSH" platform and give it the name "Migration Platform"
2. Clone this repo:  <https://github.com/davidh-cyberark/charon-punt>
   1. Copy `local.env.example` to `local.env`
   2. Edit local.env and fill in the appropriate values
   3. Build the container `make build` -- 
   4. Run the container and enter credentials when prompted
      * MUST use `--rm` -- since this is sensitive data, we do not want to leave the container running
      * MUST mount the `local.env` file -- container should only access this info
      * MUST mount `/data` as a tmpfs -- since this is sensitive data, tmpfs will create a disk in RAM only

### Usage

#### PRE REQUIREMENTS

* [Install podman](https://podman.io/docs/installation)
* [Install GNU make](https://www.gnu.org/software/make/)

#### Building and Running

```bash
make build # this might take a couple minutes
podman run --rm -it --name punt -v $(pwd)/local.env:/tmp/local.env --mount type=tmpfs,destination=/data localhost/punt:latest
```

## Repo(s)

* <https://github.com/davidh-cyberark/charon-punt>
* <https://github.com/davidh-cyberark/vault-safe-cli.git>

## COLOPHON

Charon is the ferryman on the river Styx.

A punt is the type of boat that Charon used.

https://en.wikipedia.org/wiki/Punt_(boat)

## Contributing

No outside contributions are expected for this repo.

## License

```text
    Copyright (c) 2023 CyberArk Software Ltd. All rights reserved.
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
       http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
```

For the full license text see [`LICENSE`](LICENSE).
