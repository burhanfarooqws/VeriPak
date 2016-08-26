using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class details : System.Web.UI.Page
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
                this.lblISBN.Text = book.isbn;
                this.lblPrice.Text = book.price.ToString();
                this.lblPublishYear.Text = book.publish_year.ToString();
                this.lblStatus.Text = book.status;
                if (book.status == "checkout")
                {
                    lblIsBorrowed.Text = "Book Already Borrowed";
                }
            }
        }
    }
}