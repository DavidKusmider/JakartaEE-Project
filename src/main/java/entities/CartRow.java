package entities;

import jakarta.persistence.*;
import model.VideoGameDAO;

@Entity
@Table(name = "CartRow", schema = "Database_Jakarta_Project")
public class CartRow {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "cartId", nullable = false)
    private int cartId;
    @Basic
    @Column(name = "userId", nullable = false)
    private int userId;
    @Basic
    @Column(name = "videoGameId", nullable = false)
    private int gameId;
    @Basic
    @Column(name = "quantity", nullable = false)
    private int quantity;

    public void setCartId(int cartId) { this.cartId=cartId; }
    public int getCartId() { return cartId; }

    public void setUserId(int userId) { this.userId = userId; }
    public int getUserId() { return userId; }

    public void setGameId(int gameId) { this.gameId = gameId; }
    public int getGameId() { return gameId; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
    public int getQuantity() { return quantity; }

    public int getPrice(){
        VideoGameDAO gameDAO = new VideoGameDAO();
        VideoGameEntity game = gameDAO.getGameById(this.gameId);
        return game.getVideoGamePrice();
    }

    public String getName() {
        VideoGameDAO gameDAO = new VideoGameDAO();
        VideoGameEntity game = gameDAO.getGameById(this.gameId);
        return game.getVideoGameName();
    }
}
