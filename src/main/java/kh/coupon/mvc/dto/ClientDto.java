package kh.coupon.mvc.dto;

public class ClientDto {

   private int client_no;
   private int member_no;   
   private String client_name;
   private String client_tel;
   private String client_address;
   private String client_registration;
   private String client_max_client;
   private String client_reservation;
   private int client_paycode;
   
   
   public ClientDto() {
      
   }


   public ClientDto(int client_no, int member_no, String client_name, String client_tel, String client_address,
         String client_registration, String client_max_client, String client_reservation, int client_paycode) {
      super();
      this.client_no = client_no;
      this.member_no = member_no;
      this.client_name = client_name;
      this.client_tel = client_tel;
      this.client_address = client_address;
      this.client_registration = client_registration;
      this.client_max_client = client_max_client;
      this.client_reservation = client_reservation;
      this.client_paycode = client_paycode;
   }


   public int getClient_no() {
      return client_no;
   }


   public void setClient_no(int client_no) {
      this.client_no = client_no;
   }


   public int getMember_no() {
      return member_no;
   }


   public void setMember_no(int member_no) {
      this.member_no = member_no;
   }


   public String getClient_name() {
      return client_name;
   }


   public void setClient_name(String client_name) {
      this.client_name = client_name;
   }


   public String getClient_tel() {
      return client_tel;
   }


   public void setClient_tel(String client_tel) {
      this.client_tel = client_tel;
   }


   public String getClient_address() {
      return client_address;
   }


   public void setClient_address(String client_address) {
      this.client_address = client_address;
   }


   public String getClient_registration() {
      return client_registration;
   }


   public void setClient_registration(String client_registration) {
      this.client_registration = client_registration;
   }


   public String getClient_max_client() {
      return client_max_client;
   }


   public void setClient_max_client(String client_max_client) {
      this.client_max_client = client_max_client;
   }


   public String getClient_reservation() {
      return client_reservation;
   }


   public void setClient_reservation(String client_reservation) {
      this.client_reservation = client_reservation;
   }


   public int getClient_paycode() {
      return client_paycode;
   }


   public void setClient_paycode(int client_paycode) {
      this.client_paycode = client_paycode;
   }
   
   
   
   
   
   
}