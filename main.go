package main

import (
	"context"
	"fmt"
	"log"
	"net/http"

	pb "github.com/Elder-Carvalho/auth-microservice/proto/auth"
)

func main() {
	client := pb.NewAuthProtobufClient("http://localhost:9000", &http.Client{})
	res, err := client.Login(context.Background(), &pb.LoginData{Email: "igor@gmail.com", Password: "123456"})
	if err != nil {
		log.Fatalln("Não deu de fazer login: %v", err)
	}
	fmt.Println(res)
}
