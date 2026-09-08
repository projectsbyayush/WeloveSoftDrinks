package model;

// One item in the shopping cart.
// Cart = List<CartItem> saved in session.
// image = file name inside Assets/drinks (example: "cola.jpg")
public class CartItem {

    private String name;
    private int price;
    private int qty;
    private String image;

    public CartItem(String name, int price, int qty, String image) {
        this.name = name;
        this.price = price;
        this.qty = qty;
        this.image = image;
    }

    public String getName() { return name; }
    public int getPrice() { return price; }
    public int getQty() { return qty; }
    public String getImage() { return image; }

    public void setQty(int qty) { this.qty = qty; }

    // total for this item = price x qty
    public int getTotal() { return price * qty; }
}
