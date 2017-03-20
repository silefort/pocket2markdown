docker build -t=pocket2notes .

docker run -v $PWD:/tmp --name=pocket2notes -ti pocket2notes
