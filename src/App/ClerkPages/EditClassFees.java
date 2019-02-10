/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ClerkPages;

import java.awt.Color;
import java.awt.Font;
import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.text.BadLocationException;

/**
 *
 * @author Sandaru Imal
 */
public final class EditClassFees extends javax.swing.JFrame {

    /**
     * Creates new form EditClassFees
     */
    public EditClassFees() {

        this.setUndecorated(false);
        this.setAlwaysOnTop(true);
        this.setResizable(true);

        initComponents();
        createColumns();
        initialize();
        ShowFees();

        Toolkit tk = Toolkit.getDefaultToolkit();
        int xsize = (int) tk.getScreenSize().getWidth() / 2;
        int ysize = (int) tk.getScreenSize().getHeight() / 2;
        this.setSize(xsize, ysize);

    }

    class Fees {

        private final String SubjectCode;
        private final String Grade;
        private final String Subject;
        private final Double Monthly_Fee;

        public Fees(String SubjectCode, String Grade, String Subject, Double Monthly_Fee) {
            this.SubjectCode = SubjectCode;
            this.Grade = Grade;
            this.Subject = Subject;
            this.Monthly_Fee = Monthly_Fee;
        }

        public String getSubjectCode() {
            return SubjectCode;
        }

        public String getGrade() {
            return Grade;
        }

        public String getSubject() {
            return Subject;
        }

        public Double getMonthly_Fee() {
            return Monthly_Fee;
        }
    }

    public void initialize() {
        JTableHeader th = Table.getTableHeader();
        th.setBackground(Color.DARK_GRAY);
        th.setForeground(Color.WHITE);
        th.setFont(new Font("Tahome", Font.BOLD, 20));
        Table.setRowHeight(73);
        Table.setRowHeight(73);

    }

    private void createColumns() {

        DefaultTableModel dm = (DefaultTableModel) Table.getModel();

        dm.addColumn("Subject Code");
        dm.addColumn("Suject");
        dm.addColumn("Grade");
        dm.addColumn("Monthly Fee");
    }

    public Connection getConnection() {

        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nuwana", "root", "");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return con;
    }

    public void addFees() {
        String subject = txtSubject.getText();
        String grade = comboGrade.getSelectedItem().toString();
        String subjectCode = txtSubjectCode.getText();
        String monthlyFee = txtMonthlyFee.getText();

        try {
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String query1 = "INSERT INTO monthly_fees(Subject_Code,Grade,Subject,Monthly_Fee)VALUES('" + subjectCode + "','" + grade + "','" + subject + "','" + monthlyFee + "')";
            int n1 = stmt.executeUpdate(query1);
            if (n1 != 0) {
                txtDisplay.setText("Data Added Successfully");
            } else {
                txtDisplay.setText("Please Try Again");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(rootPane, e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(rootPane, e.getMessage());
        }
    }

    public ArrayList<Fees> monthlyFee() {
        ArrayList<Fees> List = new ArrayList<>();
        try {
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String query1 = "SELECT * FROM monthly_fees";
            try (ResultSet rs = stmt.executeQuery(query1)) {
                Fees fees;
                while (rs.next()) {
                    fees = new Fees(rs.getString("Subject_Code"),
                            rs.getString("Grade"),
                            rs.getString("Subject"),
                            rs.getDouble("Monthly_Fee")
                    );
                    List.add(fees);

                }
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(rootPane, e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(rootPane, e.getMessage());

        }

        return List;
    }

    public void ShowFees() {
        ArrayList<Fees> list = monthlyFee();
        DefaultTableModel model = (DefaultTableModel) Table.getModel();
        Object[] row = new Object[4];
        for (int i = 0; i < list.size(); i++) {
            row[0] = list.get(i).getSubjectCode();
            row[1] = list.get(i).getSubject();
            row[2] = list.get(i).getGrade();
            row[3] = list.get(i).getMonthly_Fee();
            model.addRow(row);
        }
        Table.setModel(model);
    }

    public void DeleteFees() {
        try {
            DefaultTableModel model = (DefaultTableModel) Table.getModel();
            Object[] row1 = new Object[4];
            Connection con = getConnection();
            Statement st = con.createStatement();
            int row = Table.getSelectedRow();

            String cell = Table.getModel().getValueAt(row, 0).toString();
            String query3 = "DELETE FROM monthly_fees WHERE Subject_Code ='" + cell + "'";

            int n3 = st.executeUpdate(query3);
            if (n3 != 0) {
                txtDisplay.setText("Records Deleted Successfully");
            } else {
                txtDisplay.setText("Please Try Again");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(rootPane, e.getMessage());
        }
    }

    public void subjectCode() {
        try {
            String grade = comboGrade.getSelectedItem().toString();
            String subject = txtSubject.getText(0, 2);

            if (comboGrade.getSelectedItem() == "REVISION") {
                String subjectCode1 = "Re" + "-" + subject;
                txtSubjectCode.setText(subjectCode1);
            } else {
                String subjectCode = grade + "" + subject;

                txtSubjectCode.setText(subjectCode);
            }

        } catch (HeadlessException | BadLocationException e) {
            e.getMessage();
        }
    }

    public void display() {
        DefaultTableModel model = (DefaultTableModel) Table.getModel();
        Object[] row = new Object[4];

        row[0] = txtSubjectCode.getText();
        row[1] = txtSubject.getText();
        row[2] = comboGrade.getSelectedItem().toString();
        row[3] = txtMonthlyFee.getText();
        model.addRow(row);

        Table.setModel(model);

    }

    public void Show() {
        try {
            DefaultTableModel model = (DefaultTableModel) Table.getModel();
            Object[] row = new Object[4];
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            String query4 = "SELECT * FROM monthly_fees";
            ResultSet rs3 = stmt.executeQuery(query4);
            while (rs3.next()) {
                row[0] = rs3.getString("Subject_Code");
                row[1] = rs3.getString("Subject");
                row[2] = rs3.getString("Grade");
                row[3] = rs3.getString("Monthly_Fee");
                model.addRow(row);

                Table.setModel(model);
            }

        } catch (SQLException e) {
            e.getMessage();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel15 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel23 = new javax.swing.JLabel();
        txtMonthlyFee = new javax.swing.JTextField();
        jLabel22 = new javax.swing.JLabel();
        comboGrade = new javax.swing.JComboBox<>();
        txtSubjectCode = new javax.swing.JTextField();
        jLabel24 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        txtSubject = new javax.swing.JTextField();
        txtDisplay = new javax.swing.JTextField();
        jButton5 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        Table = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(255, 204, 51));

        jLabel1.setBackground(new java.awt.Color(97, 212, 195));
        jLabel1.setFont(new java.awt.Font("Engravers MT", 1, 24)); // NOI18N
        jLabel1.setText("NUWANA");

        jLabel2.setBackground(new java.awt.Color(97, 212, 195));
        jLabel2.setFont(new java.awt.Font("Engravers MT", 1, 24)); // NOI18N
        jLabel2.setText("INSTITUTE");

        jLabel4.setBackground(new java.awt.Color(97, 212, 195));
        jLabel4.setFont(new java.awt.Font("Edwardian Script ITC", 0, 24)); // NOI18N
        jLabel4.setText("\"Beyond the Norm\"");

        jPanel2.setBackground(new java.awt.Color(153, 255, 153));

        jLabel15.setBackground(new java.awt.Color(51, 51, 51));
        jLabel15.setFont(new java.awt.Font("Century Gothic", 1, 22)); // NOI18N
        jLabel15.setText("Manage Class Fees");

        jLabel23.setBackground(new java.awt.Color(36, 47, 65));
        jLabel23.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel23.setText("Subject");

        txtMonthlyFee.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N

        jLabel22.setBackground(new java.awt.Color(36, 47, 65));
        jLabel22.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel22.setText("Grade");

        comboGrade.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        comboGrade.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "6", "7", "8", "9", "10", "11", "12", "13", "REVISION" }));
        comboGrade.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                comboGradeMouseReleased(evt);
            }
        });
        comboGrade.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                comboGradeActionPerformed(evt);
            }
        });

        txtSubjectCode.setEditable(false);
        txtSubjectCode.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        txtSubjectCode.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSubjectCodeActionPerformed(evt);
            }
        });

        jLabel24.setBackground(new java.awt.Color(36, 47, 65));
        jLabel24.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel24.setText("Monthly Feee");

        jLabel25.setBackground(new java.awt.Color(36, 47, 65));
        jLabel25.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel25.setText("Subject Code");

        jButton3.setBackground(new java.awt.Color(255, 255, 255));
        jButton3.setFont(new java.awt.Font("Century Gothic", 1, 20)); // NOI18N
        jButton3.setText("Clear");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setBackground(new java.awt.Color(255, 255, 255));
        jButton4.setFont(new java.awt.Font("Century Gothic", 1, 20)); // NOI18N
        jButton4.setText("Save");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        txtSubject.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N

        txtDisplay.setEditable(false);
        txtDisplay.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N

        jButton5.setBackground(new java.awt.Color(255, 255, 255));
        jButton5.setFont(new java.awt.Font("Century Gothic", 1, 20)); // NOI18N
        jButton5.setText("Delete Selected Data");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jButton5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addContainerGap())
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jButton4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jButton3)
                        .addGap(34, 34, 34))))
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addGap(0, 1, Short.MAX_VALUE)
                        .addComponent(jLabel24, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(12, 12, 12)
                        .addComponent(txtMonthlyFee, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel25, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtSubjectCode, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel23, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtSubject, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 139, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(comboGrade, javax.swing.GroupLayout.PREFERRED_SIZE, 183, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(txtDisplay, javax.swing.GroupLayout.Alignment.TRAILING))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel23, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtSubject, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(31, 31, 31)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(comboGrade, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtSubjectCode, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel25, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel24, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtMonthlyFee, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 308, Short.MAX_VALUE)
                .addComponent(txtDisplay, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(35, 35, 35))
        );

        Table.setBackground(new java.awt.Color(3, 3, 3));
        Table.setBorder(new javax.swing.border.MatteBorder(null));
        Table.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        Table.setForeground(new java.awt.Color(255, 255, 255));
        Table.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        Table.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TableMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(Table);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 797, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(421, 421, 421)
                        .addComponent(jLabel15, javax.swing.GroupLayout.PREFERRED_SIZE, 255, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(116, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel15, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(5, 5, 5)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1))
                .addContainerGap(170, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(161, 161, 161)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(131, 131, 131)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 399, Short.MAX_VALUE)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(41, 41, 41)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 259, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 161, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void comboGradeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_comboGradeActionPerformed
        subjectCode();
    }//GEN-LAST:event_comboGradeActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        txtDisplay.setText("");
        txtMonthlyFee.setText("");
        txtSubject.setText("");
        txtSubjectCode.setText("");
        comboGrade.setSelectedItem(6);
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        addFees();
        display();


    }//GEN-LAST:event_jButton4ActionPerformed

    private void txtSubjectCodeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSubjectCodeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtSubjectCodeActionPerformed

    private void TableMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TableMouseClicked

    }//GEN-LAST:event_TableMouseClicked

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        DeleteFees();
        Show();

    }//GEN-LAST:event_jButton5ActionPerformed

    private void comboGradeMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_comboGradeMouseReleased

    }//GEN-LAST:event_comboGradeMouseReleased

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(EditClassFees.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(EditClassFees.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(EditClassFees.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(EditClassFees.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> {
            new EditClassFees().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTable Table;
    private javax.swing.JComboBox<String> comboGrade;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField txtDisplay;
    private javax.swing.JTextField txtMonthlyFee;
    private javax.swing.JTextField txtSubject;
    private javax.swing.JTextField txtSubjectCode;
    // End of variables declaration//GEN-END:variables
}
