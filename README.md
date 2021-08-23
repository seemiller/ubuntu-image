# ubuntu image

Just a pre-baked ubuntu image with some packages installed for trying things out...

Build it:

```shell
docker build --tag seemiller/ubuntu .
```

Rebuild at a stage

```shell
docker build --no-cache --target base --tag seemiller/ubuntu .
```

Push to DockerHub:

```shell
docker push seemiller/ubuntu
```

Run it locally:

```shell
docker run --interactive --tty --entrypoint /bin/bash seemiller/ubuntu
```

Deploy to a cluster
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
  - image: seemiller/ubuntu
#    command:
#    - "sleep"
#    - "604800"
    imagePullPolicy: IfNotPresent
    name: ubuntu
  restartPolicy: Always
EOF
```

