# Alpine image with Apache Benchmark

A compact OCI image built on Alpine, with apache2-utils package installed for Apache Benchmark load tester.

# GitHub Workflow for building OCI image

[github-actions-buildOCI.yml](.github/workflows/github-actions-buildOCI.yml) creates an OCI image using [Dockerfile](dockerfile).

This is triggered by creating a tag that looks like the semantic tag that starts with "v" (e.g. vX.Y.Z), and is published to:

* [GitHub Container Registry](https://github.blog/2020-09-01-introducing-github-container-registry/)


# Creating tag

```
newtag=v1.0.1
git commit -a -m "changes for new tag $newtag" && git push
git tag $newtag && git push origin $newtag
```

# Pulling image from GitHub Container Registry

```
docker pull ghcr.io/fabianlee/alpine-apache-benchmark:latest
```

# Deleting tag

```
# delete local tag, then remote
todel=v1.0.1
git tag -d $todel && git push origin :refs/tags/$todel
```



