### BUILD
```
docker build --platform linux/x86_64 -t metal-api-image .
```

### RUN
##### From metal-api repo folder run
```
docker run -it --privileged \
  --name metalapi \
  -v $(pwd):/home/project \
  --platform linux/x86_64 \
  metal-api-image
```
- Run container and generate ssh key
- Add key to your github account
- Add github to known hosts ```ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts```
- Run ```go mod tidy```
- Run ``` make test```
