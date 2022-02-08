package dao;

public class UserObj {
  private String id, password, name, ts;
  public UserObj(String id, String password, String name, String ts) {
    this.id = id;
    this.password = password;
    this.name = name;
    this.ts = ts;
  }
  public String getId() {return this.id;}
  public String getPassword() {return this.password;}
  public String getName() {return this.name;}
  public String getTs() {return this.ts;}
}
