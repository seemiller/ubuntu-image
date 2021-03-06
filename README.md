# ubuntu image

Just a pre-baked ubuntu image with some packages installed for trying things out...

Build it:

```shell
docker build --tag seemiller/ubuntu:0.0.3 .
```

Rebuild at a stage

```shell
docker build --no-cache --target base --tag seemiller/ubuntu:0.0.3 .
```

Push to DockerHub:

```shell
docker push seemiller/ubuntu:0.0.3
```

Run it locally:

```shell
docker run --interactive --tty --entrypoint /bin/bash seemiller/ubuntu
```

Deploy to a cluster

The short and quick way

```shell
kubectl run ubuntu --image seemiller/ubuntu:0.0.3
```

Or the long way

```shell
cat <<EOF | kubectl apply --filename -
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
  labels:
    app: ubuntu
spec:
  containers:
  - image: seemiller/ubuntu:0.0.3
    imagePullPolicy: IfNotPresent
    name: ubuntu
  restartPolicy: Always
EOF
```

Exec to the cluster

```shell
kubectl exec -it ubuntu -- /bin/bash
```

