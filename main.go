package main

import (
	"github.com/astaxie/beego"
	_ "blog/models"
	_ "blog/routers"
)

func main() {
	beego.Run()
}
