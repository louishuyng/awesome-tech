package main

import (
	"html/template"
	"io"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// TEMPLATE RENDERER
type Template struct {
	templates *template.Template
}

func (t *Template) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
	return t.templates.ExecuteTemplate(w, name, data)
}

func newTemplate() *Template {
	return &Template{
		templates: template.Must(template.ParseGlob("views/*.html")),
	}
}

// DATA
type Count struct {
	Count int
}

type Contact struct {
	Name  string
	Email string
}

type Contacts = []Contact

type Data struct {
	Count    Count
	Contacts Contacts
}

func (d Data) hasEmail(email string) bool {
	for _, contact := range d.Contacts {
		if contact.Email == email {
			return true
		}
	}

	return false
}

type FormData struct {
	Values map[string]string
	Errors map[string]string
}

type Page struct {
	Form FormData
	Data Data
}

// HELPERS
func newContact(name string, email string) Contact {
	return Contact{
		Name:  name,
		Email: email,
	}
}

func newData() Data {
	return Data{
		Count: Count{Count: 0},
		Contacts: []Contact{
			newContact("Jane Doe 2", "asdf"),
			newContact("Jane Doe 3", "test3@gmail.com"),
		},
	}
}

func newFormData() FormData {
	return FormData{
		Values: make(map[string]string),
		Errors: make(map[string]string),
	}
}

func newPage() Page {
	return Page{
		Data: newData(),
		Form: newFormData(),
	}
}

// MAIN
func main() {
	e := echo.New()
	e.Use(middleware.Logger())

	e.Renderer = newTemplate()

	page := newPage()

	e.GET("/", func(c echo.Context) error {
		page.Data.Count.Count++
		return c.Render(200, "index", page)
	})

	e.POST("/count", func(c echo.Context) error {
		page.Data.Count.Count++

		return c.Render(200, "count", page)
	})

	e.POST("/contacts", func(c echo.Context) error {
		name := c.FormValue("name")
		email := c.FormValue("email")

		if page.Data.hasEmail(email) {
			formData := newFormData()
			formData.Values["name"] = name
			formData.Values["email"] = email
			formData.Errors["email"] = "Email already exists"

			return c.Render(422, "form", formData)
		}

		contact := newContact(name, email)
		page.Data.Contacts = append(page.Data.Contacts, contact)

		c.Render(200, "form", newFormData())
		return c.Render(200, "oob-contact", contact)
	})

	e.Logger.Fatal(e.Start(":42609"))
}
