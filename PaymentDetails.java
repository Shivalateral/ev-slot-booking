package concer;
public class PaymentDetails {
    private String paymentId;
    private String bookingId;
    private String paymentMode;
    private double amount;
    private String upi;
    private double bankAmount;

    // Constructor
    public PaymentDetails(String paymentId, String bookingId, String paymentMode, double amount, String upi, double bankAmount) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.paymentMode = paymentMode;
        this.amount = amount;
        this.upi = upi;
        this.bankAmount = bankAmount;
    }

    // Getters
    public String getPaymentId() {
        return paymentId;
    }

    public String getBookingId() {
        return bookingId;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public double getAmount() {
        return amount;
    }

    public String getUpi() {
        return upi;
    }

    public double getBankAmount() {
        return bankAmount;
    }
}
