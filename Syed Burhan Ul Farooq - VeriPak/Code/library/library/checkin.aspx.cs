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
                
                //if (book.status == "checkout")
                //{
                //    lblIsBorrowed.Text = "Book Already Borrowed";
                //    btnCheckOut.Enabled = false;
                //}

                borrowhistory objBorrowHistory = db.borrowhistories.Where<borrowhistory>(x => x.bookid == bookid).OrderBy(x => x.id).FirstOrDefault();
                this.txtCheckOutDate.Text = objBorrowHistory.checkout_date.ToShortDateString();
                this.txtCheckInDate.Text = objBorrowHistory.checkin_date.ToShortDateString();
                this.txtReturnDate.Text = DateTime.Now.ToShortDateString();
                this.txtBorrower.Text = objBorrowHistory.borrower;
                this.txtMobile.Text = objBorrowHistory.mobile;
                int bDays = checkin.GetBusinessDays(objBorrowHistory.checkout_date, DateTime.Now); 
                if(bDays > 15)
                {
                    this.lblMessage.Text = "Penalty of 5 Dhs will be charged for over days."+ "\n" + "You need to pay: " + Math.Abs(bDays - 15) * 5 + " Dhs";
                }
                
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

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

    }
}