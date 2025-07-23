package lk.jiat.app.web.servlet;

import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;
import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.app.core.model.Transaction;
import lk.jiat.app.core.model.Account;
import lk.jiat.app.core.model.TransactionType;
import lk.jiat.app.core.service.TransactionService;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet("/export/transactions/pdf")
public class TransactionPdfExportServlet extends HttpServlet {

    @EJB
    private TransactionService transactionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=transactions.pdf");

        List<Transaction> transactions = transactionService.getAllTransactions();

        try {
            OutputStream out = resp.getOutputStream();
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();

            document.add(new Paragraph("Transaction History Report - Nations Bank\n\n"));

            Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

            Table table = new Table(8);
            table.addCell(new Phrase("ID", boldFont));
            table.addCell(new Phrase("From", boldFont));
            table.addCell(new Phrase("To", boldFont));
            table.addCell(new Phrase("Amount", boldFont));
            table.addCell(new Phrase("Description", boldFont));
            table.addCell(new Phrase("Type", boldFont));
            table.addCell(new Phrase("Status", boldFont));
            table.addCell(new Phrase("Date", boldFont));

            for (Transaction t : transactions) {

                Account from = t.getFrom_account();
                Account to = t.getToAccount();
                TransactionType type = t.getTransaction_type();

                table.addCell(String.valueOf(t.getId()));
                table.addCell(from != null && from.getUser() != null ? from.getUser().getFirstName() : "N/A");
                table.addCell(to != null && to.getUser() != null ? to.getUser().getFirstName() : "N/A");
                table.addCell("Rs. " + String.format("%.2f", t.getAmount()));
                table.addCell(t.getDescription() != null ? t.getDescription() : "N/A");
                table.addCell(type != null ? type.getTransaction_type() : "N/A");
                table.addCell(t.getStatus() != null ? t.getStatus() : "N/A");
                table.addCell(t.getCreatedAt() != null ? t.getCreatedAt().toString() : "N/A");
            }

            document.add(table);
            document.close();
            out.close();

        } catch (DocumentException e) {
            throw new IOException("Error generating PDF", e);
        }
    }
}
