package main

import (
	"io"
	"log"
	"time"
	"net/http"
)

func main() {
	for {
		resp, err := http.Get("http://localhost:8080/addNumber")
		if err != nil {
			log.Fatalf("can't get response %v", err)
		}

		data, err := io.ReadAll(resp.Body)
		if err != nil {
			log.Fatalf("can't read data %v", err)
		}
		log.Printf("number = %v", data)

		time.Sleep(10 * time.Second)
	}
}
