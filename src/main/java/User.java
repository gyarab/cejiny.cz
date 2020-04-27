public class User {
    // uzivatel bude mit id, uzivatelske jmeno a heslo
    private int id;
    private String username;
    private String password;

    // gettery a settery pro nastaveni uzivatele
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
