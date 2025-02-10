package Model

type Book struct {
	ID         uint   `json:"id" db:"id"`
	Title      string `json:"title" db:"title" binding:"required,min=5,max=255"`
	Author     string `json:"author" db:"author" binding:"required,min=5"`
	Quantity   int    `json:"quantity" db:"quantity" binding:"required,gte=1"`
	CategoryID uint   `json:"category_id" db:"category_id" binding:"required,gte=1"`
}