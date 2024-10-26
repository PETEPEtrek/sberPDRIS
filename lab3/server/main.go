package main

import (
	"fmt"
	"log"
	"net/http"
	"sync/atomic"
)

var (
	k = atomic.Uint64{}
)

func addNumber(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "%v", k.Load())
	k.Add(1)
}

func main() {
	k.Store(0)
	http.HandleFunc("/add_number", addNumber)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalf("could not serve on 8080 port: %v", err)
		return
	}
}
