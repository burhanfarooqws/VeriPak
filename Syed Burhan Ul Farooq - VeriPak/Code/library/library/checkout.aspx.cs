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
                this.txtReturnDate.Text = Rules.AddBusinessDays(DateTime.Now, 15).ToShortDateString();
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
            
            book objBook = db.books.Where<book>(x => x.id == bookid).FirstOrDefault();
            if(objBook.status == "checkout")
            {
                lblMessage.Text = "Book not available";
            }
            else
            {
                borrowhistory bh = new borrowhistory();
                bh.bookid = bookid;
                bh.borrower = this.txtBorrower.Text;
                bh.checkin_date = Rules.AddBusinessDays(DateTime.Now, 14);
                bh.checkout_date = DateTime.Now;
                bh.nationalid = this.txtNationalID.Text;
                bh.mobile = this.txtMobile.Text;
                db.borrowhistories.AddObject(bh);

                objBook.status = "checkout";
                lblMessage.Text = "CheckOut Successfull";

                db.SaveChanges();
            }

            db.lockbooks.DeleteObject(objLockBook);
            db.SaveChanges();
        }
    }
}