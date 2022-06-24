package main

import (
	"net/http"

	"github.com/gin-gonic/gin"

)

type album struct {
	client_name   string `json:"client_name"`
	client_region string `json:"client_region"`
	GST           int    `json:"GST"`
}

var albums = []album{
	{client_name: "hill", client_region: "delhi", GST: 12},
	{client_name: "john", client_region: "mumbai", GST: 52},
}

func main() {
	router := gin.Default()
	router.GET("/albums", getAlbums)
	router.POST("/albums", postAlbums)

	router.Run("localhost:8080")
}

func getAlbums(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, albums)
}

func postAlbums(c *gin.Context) {
	var newAlbum album
	err := c.BindJSON(&newAlbum)
	if err != nil {
		return
	}
	albums = append(albums, newAlbum)
	c.IndentedJSON(http.StatusCreated, newAlbum)
}
sssssss