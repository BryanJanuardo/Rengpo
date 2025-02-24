package Model

type Category struct {
	CategoryID uint   `json:"category_id" db:"id"`
	Name       string `json:"name" db:"name"`
}