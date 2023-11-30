# v0.11.2

## Bug Fixes
* fix: default additionalconfig to empty string when not set (#66) (Darren)([018ff5c](https://github.com/lacework/terraform-aws-ssm-agent/commit/018ff5cf27ba19db000e06411b7040d03ddf1b47))
## Other Changes
* ci: version bump to v0.11.2-dev (Lacework)([defed1b](https://github.com/lacework/terraform-aws-ssm-agent/commit/defed1ba575a5586500772a0b29ccbb311773c3e))
---
# v0.11.1

## Bug Fixes
* fix: rendering additional config (#63) (Darren)([d19d290](https://github.com/lacework/terraform-aws-ssm-agent/commit/d19d2904eed478d19bd3f037250fa1338a5455fc))
## Other Changes
* ci: version bump to v0.11.1-dev (Lacework)([58e7bbc](https://github.com/lacework/terraform-aws-ssm-agent/commit/58e7bbce458ba1e00a8c2e1143c682c88570d7b0))
---
# v0.11.0

## Features
* feat: add support for agent configuration (#60) (Darren)([0742b18](https://github.com/lacework/terraform-aws-ssm-agent/commit/0742b185b365155424d537583e74fbbf8a8238d7))
## Documentation Updates
* docs(readme): add terraform docs automation (#59) (Timothy MacDonald)([f274141](https://github.com/lacework/terraform-aws-ssm-agent/commit/f274141e79bd2495a2b1cf99fb83779f20986ba1))
## Other Changes
* ci: version bump to v0.10.5-dev (Lacework)([2294ccc](https://github.com/lacework/terraform-aws-ssm-agent/commit/2294cccedaf68cd79d63f3019dd03bc625bc8aa8))
---
# v0.10.4

## Bug Fixes
* fix: use correct type for enable syscall var (#56) (Nick Schmeller)([6fd17da](https://github.com/lacework/terraform-aws-ssm-agent/commit/6fd17dacb74a8d3d41ebfd8ad77e9ccd0ff4d141))
## Other Changes
* ci: version bump to v0.10.4-dev (Lacework)([3a15e10](https://github.com/lacework/terraform-aws-ssm-agent/commit/3a15e10991f5be8537a8852ba5eb8d7eab44496a))
---
# v0.10.3

## Bug Fixes
* fix: switch from bool to string for enable syscall (#53) (Nick Schmeller)([c72edbc](https://github.com/lacework/terraform-aws-ssm-agent/commit/c72edbc8a16947bd48b86f6ef6ff4a653c2e628d))
## Other Changes
* ci: version bump to v0.10.3-dev (Lacework)([7e6ba4b](https://github.com/lacework/terraform-aws-ssm-agent/commit/7e6ba4b320830e747bedebd842ffa42574192aa1))
---
# v0.10.2

## Bug Fixes
* fix: update incorrect variable name (#51) (Nick Schmeller)([aad18bc](https://github.com/lacework/terraform-aws-ssm-agent/commit/aad18bc801eef81fd8c6ae8558128dc583ac783b))
## Other Changes
* ci: version bump to v0.10.2-dev (Lacework)([c244ddf](https://github.com/lacework/terraform-aws-ssm-agent/commit/c244ddf82845738522e4c6075511edef45e8f12c))
---
# v0.10.1

## Bug Fixes
* fix: correctly use syscall Terraform toggle (#48) (Nick Schmeller)([12e844c](https://github.com/lacework/terraform-aws-ssm-agent/commit/12e844cb15e2d77128fd622dcae4c434f9d7ddd0))
## Other Changes
* ci: version bump to v0.10.1-dev (Lacework)([2c7d693](https://github.com/lacework/terraform-aws-ssm-agent/commit/2c7d69362851d9ba014a62ce7082ffe284551bce))
---
# v0.10.0

## Features
* feat: add flag to add syscall default config (#46) (Nick Schmeller)([d65fb2f](https://github.com/lacework/terraform-aws-ssm-agent/commit/d65fb2f9baa7d7f99399526f211bb589d64d5e16))
## Bug Fixes
* fix(CPLAT-672): Update references to api.lacework.net (Atul Singh)([33816ec](https://github.com/lacework/terraform-aws-ssm-agent/commit/33816ec56d57078b1bbbe02b2a260b22475c9308))
## Other Changes
* ci: version bump to v0.9.1-dev (Lacework)([2674dec](https://github.com/lacework/terraform-aws-ssm-agent/commit/2674dec2101ffd670d800238e09bd95687ce0df2))
---
# v0.9.0

## Features
* feat: Add support for AWS provider 5.0 (Darren)([7edd3c9](https://github.com/lacework/terraform-aws-ssm-agent/commit/7edd3c985eb5bdd1d238db1c341ca8ad8e9ad752))
## Documentation Updates
* docs(RAIN-54746): update example urls (Atul Singh)([dcb7bb8](https://github.com/lacework/terraform-aws-ssm-agent/commit/dcb7bb80bdcdc36170cb3067c2d446a187a6a67e))
## Other Changes
* ci: tfsec (jon-stewart)([177d6f9](https://github.com/lacework/terraform-aws-ssm-agent/commit/177d6f92aada541eba1ffb30e33374e8d570a662))
* ci: version bump to v0.8.2-dev (Lacework)([1c0bfc1](https://github.com/lacework/terraform-aws-ssm-agent/commit/1c0bfc14d1daf1f2c4c7d19d59ac004c9b2d9a19))
---
# v0.8.1

## Bug Fixes
* fix: pass server url to agent install.sh (#38) (Salim Afiune)([6f666c5](https://github.com/lacework/terraform-aws-ssm-agent/commit/6f666c5cbac3701648b026e7fe5e7a1fa521d076))
## Other Changes
* ci: version bump to v0.8.1-dev (Lacework)([652b6c4](https://github.com/lacework/terraform-aws-ssm-agent/commit/652b6c479ef70b25483a1f514fe2e3f01a988a4b))
---
# v0.8.0

## Features
* feat: deprecate support for Terraform 0.12 and 0.13 (Darren Murray)([c2532b1](https://github.com/lacework/terraform-aws-ssm-agent/commit/c2532b1895c14d71361a46b4c4498b200995b767))
## Bug Fixes
* fix: update installation URL for custom build hashes (#35) (Salim Afiune)([870ea31](https://github.com/lacework/terraform-aws-ssm-agent/commit/870ea319feec9296f599abedc88f28164e59134e))
## Other Changes
* ci: version bump to v0.7.1-dev (Lacework)([627d794](https://github.com/lacework/terraform-aws-ssm-agent/commit/627d7948e9656f679934d1b400e8c83c028caec9))
---
# v0.7.0

## Features
* feat: adding ability to customize temporary path (#32) (Alan Nix)([e03845f](https://github.com/lacework/terraform-aws-ssm-agent/commit/e03845fa6b5912ad4d070bd92a3d1ee21f9b3cf3))
## Other Changes
* ci: version bump to v0.6.1-dev (Lacework)([508003e](https://github.com/lacework/terraform-aws-ssm-agent/commit/508003e364bcb9ff468e3b6c3bf5a4a88c6e9484))
---
# v0.6.0

## Features
* feat: allow use of v4 aws provider (#30) (Darren)([067abf8](https://github.com/lacework/terraform-aws-ssm-agent/commit/067abf8b54d68ef6afd6d7d9319c0ab908f72e93))
## Other Changes
* chore: update PR template (#29) (Darren)([886c80e](https://github.com/lacework/terraform-aws-ssm-agent/commit/886c80e75b8f1cd1e725d32e552addc9e8e19b72))
* ci: version bump to v0.5.3-dev (Lacework)([54a98f1](https://github.com/lacework/terraform-aws-ssm-agent/commit/54a98f198c91e32fa3b2490be588e10f537fb387))
---
# v0.5.2

## Bug Fixes
* fix: added logic to verify agent access token (Alan Nix)([fe889a3](https://github.com/lacework/terraform-aws-ssm-agent/commit/fe889a3e5a9a14041a5fc097405d463c3c0ac3e3))
## Documentation Updates
* docs: Add contributing documentation (#25) (Darren)([e44f96f](https://github.com/lacework/terraform-aws-ssm-agent/commit/e44f96f1f37ac95718a5a2ef6f03abda17c3447b))
## Other Changes
* chore: version bump to v0.5.2-dev (Lacework)([21855f7](https://github.com/lacework/terraform-aws-ssm-agent/commit/21855f795acd54ef3de7086a334abbabae57c3a3))
* ci: sign lacework-releng commits (#24) (Salim Afiune)([a723c2b](https://github.com/lacework/terraform-aws-ssm-agent/commit/a723c2b63f7e1aba6d7af67903e69487d656bf9a))
---
# v0.5.1

## Bug Fixes
* fix: deployment of Agent config.json file (#22) (Salim Afiune)([64c925c](https://github.com/lacework/terraform-aws-ssm-agent/commit/64c925c9857ec7738a482c0a68f92b16e52ba162))
## Other Changes
* chore: version bump to v0.5.1-dev (Lacework)([c451c68](https://github.com/lacework/terraform-aws-ssm-agent/commit/c451c688e95be946f282422c7eeed43eebe5d463))
---
# v0.5.0

## Features
* feat: adds ability to change Lacework Server URL (#20) (Darren)([4c9f0a6](https://github.com/lacework/terraform-aws-ssm-agent/commit/4c9f0a61a3c2a29993daa93ec4b7630b19878733))
## Other Changes
* chore: bump required version of TF to 0.12.31 (#18) (Scott Ford)([74ed7cf](https://github.com/lacework/terraform-aws-ssm-agent/commit/74ed7cfc53258f7efbcae7b4d0030ad4e03fec9a))
* chore: version bump to v0.4.1-dev (Lacework)([5068ac1](https://github.com/lacework/terraform-aws-ssm-agent/commit/5068ac11300e04bf9ceb95434510c411e97c4bca))
* ci: fix finding major versions during release (#17) (Salim Afiune)([45a3672](https://github.com/lacework/terraform-aws-ssm-agent/commit/45a36722adcf2a73370c95e8c49a44e2829d0d30))
---
# v0.4.0

## Features
* feat: ability to specify an Agent build hash (#14) (Salim Afiune)([bc20188](https://github.com/lacework/terraform-aws-ssm-agent/commit/bc20188091df4ba52843675ae4126688802b4746))
## Other Changes
* ci: switch PR test from CircleCI to CodeFresh (#15) (Salim Afiune)([7cacc32](https://github.com/lacework/terraform-aws-ssm-agent/commit/7cacc32f49cb04c0e430aa30fdffb6ae6e9220c5))
* ci: switch releases to be own by Lacework releng ⚡ (#13) (Salim Afiune)([265f42f](https://github.com/lacework/terraform-aws-ssm-agent/commit/265f42f0a614c227b82bdec0ffdca22b1b54079c))
---
# v0.3.0

## Features
* feat: improve support for multiple Linux distributions (#10) (Jean-Philippe Lachance)([1d9960e](https://github.com/lacework/terraform-aws-ssm-agent/commit/1d9960e270803f11aeed465ef2388ab216c46ed9))
## Bug Fixes
* fix(command): typo in the tags parameter description (#9) (Jean-Philippe Lachance)([b629a8c](https://github.com/lacework/terraform-aws-ssm-agent/commit/b629a8c3ae65cc9b2324a7b59aa871b75cc611ba))
---
# v0.2.0

## Features
* feat(command): Enable the datacollector service when disabled (#7) (Jean-Philippe Lachance)([8578d5f](https://github.com/lacework/terraform-aws-ssm-agent/commit/8578d5f564b77841e4f61b992bbf49b1860bd5f3))
## Other Changes
* ci: update release ssh-key fingerprint (#6) (Salim Afiune)([1fe6f12](https://github.com/lacework/terraform-aws-ssm-agent/commit/1fe6f12cf751fdc38996e48866664f8b7a6299f8))
---
# v0.1.0

## Features
* feat: add basic AWS SSM command to install and configure Lacework agent (#3) (Jean-Philippe Lachance)([73f85b6](https://github.com/lacework/terraform-aws-ssm-agent/commit/73f85b6141a229f69d43a38bdb7ae43d2b7908be))

## Documentation Updates
* docs: add example that use the our Terraform Provider (#4) (Salim Afiune)([1769b23](https://github.com/lacework/terraform-aws-ssm-agent/commit/1769b233c0d1f18872ada95ee390aa19614ce353))

## Other Changes
* chore: resize Lacework logo in README (#2) (Salim Afiune)([5756801](https://github.com/lacework/terraform-aws-ssm-agent/commit/57568015d7bfb14290d4cb7b3438cb3aa038d8fe))
* chore: update README.md (Salim Afiune Maya)([01760af](https://github.com/lacework/terraform-aws-ssm-agent/commit/01760af37ac56d4e4ff4e2a93fb32654d1739be3))
* chore: update LICENSE (Salim Afiune Maya)([bc4a22d](https://github.com/lacework/terraform-aws-ssm-agent/commit/bc4a22d6f68ca10fe7ff6009d167b56180242e08))
* chore: update scripts/release.sh (Scott Ford)([fc23377](https://github.com/lacework/terraform-aws-ssm-agent/commit/fc23377ccf22f1edfdf2618e036036b6339dcee6))
* chore: update scripts/ci_tests.sh (Scott Ford)([60e5bd2](https://github.com/lacework/terraform-aws-ssm-agent/commit/60e5bd296d8401689bb167f56599a43be4c74f6c))
* initial setup of repo (Scott Ford)([af2b369](https://github.com/lacework/terraform-aws-ssm-agent/commit/af2b3690f5765f1bd2007dd2b8842e7d650d03a3))
* first commit (Scott Ford)([bbce9ea](https://github.com/lacework/terraform-aws-ssm-agent/commit/bbce9ead0cd8ae6a36ac6f4426ba18ae9d40aeb6))
