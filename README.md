# Alpine image with Apache Benchmark

A compact OCI image built on Alpine, with apache2-utils package installed for Apache Benchmark load tester.

# GitHub Workflow for building OCI image

[github-actions-buildOCI.yml](.github/workflows/github-actions-buildOCI.yml) creates an Image base on busybox:glibc using [Dockerfile](dockerfile).

This is triggered by creating a tag that looks like the semantic tag that starts with "v" (e.g. vX.Y.Z)

```
newtag=v1.0.1; git tag $newtag && git push origin $newtag
```

The image is published at these locations:
* [Google Container Registry](https://github.com/fabianlee?tab=packages&repo_name=golang-github-action-example)


# Creating tag

```
newtag=v1.0.1
git commit -a -m "changes for new tag $newtag" && git push
git tag $newtag && git push origin $newtag
```

# Deleting tag

```
# delete local tag, then remote
todel=v1.0.1
git tag -d $todel && git push origin :refs/tags/$todel
```



