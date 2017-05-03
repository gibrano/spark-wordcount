# docker-spark

`docker-spark` is a little example of how count words using apache spark cluster with dockers containers.   

First you need, is clone the repository with 

`
git clone https://github.com/gibrano/docker-spark.git 
`

Then build 

`
sudo docker build -t entropyx/docker-spark:v1.0.0 .
`

To create standalone cluster 

`
docker-compose up
`

Create the numbers of node that you want

`
docker-compose scale worker=3
`

You can see the process with 

`
docker ps
`

Open console 

`
docker exec -i -t dockerspark_master_1 /bin/bash
`

Run the Word Count app locate in usr/spark-2.1.0/MyApp

`
sbt update
sbt package
spark-submit --master local[*] --class "MyApp" target/scala-2.11/my-project_2.11-1.0.jar words.txt
`

