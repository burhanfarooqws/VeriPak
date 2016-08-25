using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class checkout : System.Web.UI.Page
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
                if (book.status == "checkout")
                {
                    lblIsBorrowed.Text = "Book Already Borrowed";
                    btnCheckOut.Enabled = false;
                }
                this.txtCheckOutDate.Text = DateTime.Now.ToShortDateString();
                this.txtReturnDate.Text = checkout.AddBusinessDays(DateTime.Now, 15).ToShortDateString();
            }
        }

        public static DateTime AddBusinessDays(DateTime date, int days)
        {
            if (days < 0)
            {
                throw new ArgumentException("days cannot be negative", "days");
            }

            if (days == 0) return date;

            if (date.DayOfWeek == DayOfWeek.Saturday)
            {
                date = date.AddDays(2);
                days -= 1;
            }
            else if (date.DayOfWeek == DayOfWeek.Sunday)
            {
                date = date.AddDays(1);
                days -= 1;
            }

            date = date.AddDays(days / 5 * 7);
            int extraDays = days % 5;

            if ((int)date.DayOfWeek + extraDays > 5)
            {
                extraDays += 2;
            }

            return date.AddDays(extraDays);

        }

        public static int GetBusinessDays(DateTime start, DateTime end)
        {
            if (start.DayOfWeek == DayOfWeek.Saturday)
            {
                start = start.AddDays(2);
            }
            else if (start.DayOfWeek == DayOfWeek.Sunday)
            {
                start = start.AddDays(1);
            }

            if (end.DayOfWeek == DayOfWeek.Saturday)
            {
                end = end.AddDays(-1);
            }
            else if (end.DayOfWeek == DayOfWeek.Sunday)
            {
                end = end.AddDays(-2);
            }

            int diff = (int)end.Subtract(start).TotalDays;

            int result = diff / 7 * 5 + diff % 7;

            if (end.DayOfWeek < start.DayOfWeek)
            {
                return result - 2;
            }
            else
            {
                return result;
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            libraryEntities db = new libraryEntities();
            lockbook objLockBook;
            int bookid = Convert.ToInt32(this.hfbookid.Value);
            objLockBook = db.lockbooks.Where<lockbook>(x => x.bookid == bookid).FirstOrDefault();
            if (objLockBook == null)
            {
                objLockBook = new lockbook();
                objLockBook.bookid = bookid;
                objLockBook.username = User.Identity.Name;
                db.lockbooks.AddObject(objLockBook);
                db.SaveChanges();
            }
            else
            {
                lblMessage.Text = "Book not available";
                return;
            }
            borrowhistory bh = new borrowhistory();
            bh.bookid = bookid;
            bh.borrower = this.txtBorrower.Text;
            bh.checkin_date = checkout.AddBusinessDays(DateTime.Now, 15);
            bh.checkout_date = DateTime.Now;
            bh.nationalid = this.txtNationalID.Text;
            bh.mobile = this.txtMobile.Text;
            db.borrowhistories.AddObject(bh);
            db.SaveChanges();
            book objBook = db.books.Where<book>(x => x.id == bookid).FirstOrDefault();
            objBook.status = "checkout";
            lblMessage.Text = "CheckOut Successfull";

            db.lockbooks.DeleteObject(objLockBook);
            db.SaveChanges();
        }
    }
}