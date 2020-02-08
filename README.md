## Installation instructions
1. [Install Docker](https://docs.docker.com/install/)
2. [Install Git](https://git-scm.com/downloads)
3. You can directly install all dependencies by following the instructions given [here](https://github.com/gibiansky/IHaskell/#installation). **NOTE:** If you are not comfortable with this, you can move on to the next step.
4. The following commands will create a Docker image containing all the packages required during the course. It also launches a container called `ppafenv` from the image.
```
git clone https://github.com/gibiansky/IHaskell.git
cd IHaskell
docker build -t ihaskell:latest
docker run -it --name ppafenv -p8888:8888 ihaskell:latest
```
5. Open the URL for the Jupyter notebook given by the running container. For e.g.
> The Jupyter Notebook is running at:
> http://596ccf34f298:8888/?token=839a234d6a5a666199027fb5f26aa58873d64045cbebf7ba
> or http://127.0.0.1:8888/?token=839a234d6a5a666199027fb5f26aa58873d64045cbebf7ba
6. Open a terminal in the Jupyter and clone the `p-paf-lectures` repository.
```
git clone https://github.com/p-paf/p-paf-lectures.git
```
7. Open one of the notebooks and play around with it.
8. Once closed the image can be restarted with the following command. Any new files created previously will be retained.
```
docker start -ai ppafenv
```

