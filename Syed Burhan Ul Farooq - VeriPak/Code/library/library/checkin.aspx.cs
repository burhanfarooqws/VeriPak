using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class checkin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.hfbookid.Value = Request.QueryString["bookid"];
                libraryEntities db = new libraryEntities();
                int bookid = Convert.ToInt32(this.hfbookid.Value);
                book book = db.books.Where<book>(x => x.id == bookid).FirstOrDefault();
                this.lblbooktitle.Text = book.title;
                this.imgbook.ImageUrl = book.cover_picture;     

                borrowhistory objBorrowHistory = db.borrowhistories.OrderByDescending(u => u.id).FirstOrDefault(); // get the last borrower from history.
                if (objBorrowHistory != null && book.status == "checkout")
                {
                    this.txtCheckOutDate.Text = objBorrowHistory.checkout_date.ToShortDateString();
                    this.txtCheckInDate.Text = objBorrowHistory.checkin_date.ToShortDateString();
                    this.txtReturnDate.Text = DateTime.Now.ToShortDateString();
                    this.txtBorrower.Text = objBorrowHistory.borrower;
                    this.txtMobile.Text = objBorrowHistory.mobile;
                    int bDays = Rules.GetBusinessDays(objBorrowHistory.checkout_date, DateTime.Now);
                    if (bDays > 15)
                    {
                        this.lblMessage.Text = "Penalty of 5 Dhs will be charged for over days." + "\n" + "You need to pay: " + Math.Abs(bDays - 15) * 5 + " Dhs";
                    }
                }
                else
                {
                    this.lblMessage.Text = "Book Information Not Found.";
                    this.btnCheckIn.Enabled = false;
                }                
                
            }
        }
        
        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            libraryEntities db = new libraryEntities();
            int bookid = Convert.ToInt32(this.hfbookid.Value);
            book objBook = db.books.Where<book>(x => x.id == bookid).FirstOrDefault();
            if (objBook.status == "checkout")
            {
                objBook.status = "checkin";
                borrowhistory bh = new borrowhistory();
                bh = db.borrowhistories.OrderByDescending(u => u.id).FirstOrDefault(); // get the last borrower from history.
                bh.checkin_date_return = DateTime.Now;
                db.SaveChanges();
                lblMessage.Text = "CheckIn Successfull";
            }
            else
            {
                lblMessage.Text = "Book CheckIn Failed";
            }
        }
    }
}