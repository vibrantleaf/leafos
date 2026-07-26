# Bootcrew

This is a monorepo for all the Bootcrew images! These are multiple different container images made for usage with [`bootc`](https://github.com/bootc-dev/bootc), they can be used as a base to build upon and make your own full images for your usecase, similar to the work from the [Fedora Bootc Base Images](https://docs.fedoraproject.org/en-US/bootc/base-images/) and [Universal Blue](http://universal-blue.org/).

## Building and Running

In order to get a running system you can run `just build (subdirectory)`, then generate a disk image with `just disk-image (subdirectory)` for any of the images to be used. 

### Objective

None of these should need to exist, ideally all of these projects would directly publish `(project-name)-bootc` images, or at least provide a `bootc` package or bundle for it. We aim to make our images as small and basic as possible to minimize maintenance burden and make it easier to upstream any effors from them.
