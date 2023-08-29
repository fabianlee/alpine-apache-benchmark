# Alpine image with Apache Benchmark

A compact OCI image built on Alpine, with apache2-utils package installed for Apache Benchmark load tester.


# GitHub Actions for building OCI image

[github-actions-buildOCI.yml](.github/workflows/github-actions-buildOCI.yml) creates an OCI image using [Dockerfile](Dockerfile).

This is triggered by creating a tag that looks like the semantic tag that starts with "v" (e.g. vX.Y.Z), and is published to the public [GitHub Container Registry](https://github.blog/2020-09-01-introducing-github-container-registry/).


# Pulling image from GitHub Container Registry

```
docker pull ghcr.io/fabianlee/alpine-apache-benchmark:latest
```

# Running image in Kubernetes

```
# opens to shell access
kubectl run -i --rm --tty load-generator --image=ghcr.io/fabianlee/alpine-apache-benchmark:latest --restart=Never 

# runs Apache Benchmark with arguments, then exits
kubectl run -i --rm --tty load-generator --image=ghcr.io/fabianlee/alpine-apache-benchmark:latest --restart=Never --command ab -- -n4 -c2 https://www.google.com/
```

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


NOTES

https://stackoverflow.com/questions/59248318/kubectl-run-command-vs-arguments

Explains how:
  * the command field in Kubernetes corresponds to the EntryPoint field in Docker
  * the args field in Kubernetes corresponds to the Cmd field in Docker
