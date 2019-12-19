package main

import (
	"fmt"
	"net/http"
	"os"
	"runtime"
)

func main() {
	fmt.Printf("Go version: %s\n", runtime.Version())
	http.HandleFunc("/", roothandler)
	http.HandleFunc("/quit", restarthandler)
	fmt.Println("Launch server...")
	if err := http.ListenAndServe(":3000", nil); err != nil {
		fmt.Printf("Failed to launch server: %v", err)
	}
}

func roothandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from Glitch with %v!", runtime.Version())
}

func restarthandler(w http.ResponseWriter, r *http.Request) {
	os.Exit(0)
}
