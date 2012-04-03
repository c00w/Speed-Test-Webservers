package main

import (
    "net/http" //package for http based web programs
)

func handler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("<b> Hello World </b>"))
}

func main() {
    http.HandleFunc("/", handler) // redirect all urls to the handler function
    http.ListenAndServe("localhost:9999", nil) // listen for connections at port 9999 on the local machine
}
