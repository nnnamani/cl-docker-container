# cl-docker-container

Docker file to build container running Common Lisp.
This container use [Roswell](https://github.com/roswell/roswell) to run sbcl, By default, connectable to its REPL on port 4005 with Swank.


## Useage
1. [Install Docker](https://www.google.com/search?q=Install+Docker&oq=Install+Docker).


2. Clone this.
```
git clone https://github.com/nnnamani/cl-docker-container.git
```

3. Build image.
```
cd cl-docker-container
docker build ./ -t cl-docker-container
```

4. Run container
```
docker run -itd -p 4005:4005 --name cl cl-docker-container
# ==> run container named 'cl'
```

5. Connect to container from Emacs use slime-connect.
    1. Enter `M-x slime-connect` on Emacs.
    1. `Host: localhost`
    1. `Port: 4005`

