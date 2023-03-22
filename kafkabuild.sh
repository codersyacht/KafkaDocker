docker build . -t codersyacht/kafka:v1
docker run -idt -p 9080:9092 -p 9092:9092  --name kafka --hostname kafka codersyacht/kafka:v1