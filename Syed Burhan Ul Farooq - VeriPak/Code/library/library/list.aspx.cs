using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {

            }
        }
                
        protected void btndetails_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.hfBookId.Value)) return;
            Response.Redirect("details.aspx?bookid=" + this.hfBookId.Value);
        }

        protected void btncheckin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.hfBookId.Value)) return;
            Response.Redirect("checkin.aspx?bookid=" + this.hfBookId.Value);
        }

        protected void btncheckout_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.hfBookId.Value)) return;
            Response.Redirect("checkout.aspx?bookid=" + this.hfBookId.Value);
        }

        protected void RowSelector_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}