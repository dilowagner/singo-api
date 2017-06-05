package main

import (
	"net/http"
	"os"

	singo "github.com/dilowagner/singo-ie-validation"

	"gopkg.in/gin-gonic/gin.v1"
)

// Validate function
// Retorna se a inscrição de um determinado estado passado por parâmetro é valida
func Validate(uf, insc string) (bool, error) {

	validator := singo.NewIEValidator()
	validator.UF = uf
	validator.IE = insc

	return validator.Validate()
}

func main() {

	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	port := os.Getenv("PORT")

	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "API para validacao de inscrições estaduais"})
	})

	router.GET("/singo/:uf/:insc", func(c *gin.Context) {
		uf := c.Param("uf")
		insc := c.Param("insc")

		result, err := Validate(uf, insc)
		if err != nil {
			c.JSON(http.StatusNotFound, gin.H{"status": http.StatusNotFound, "error": err.Error()})
		}
		c.JSON(http.StatusOK, gin.H{"status": http.StatusOK, "success": result})
	})

	router.Run(":" + port)
}
