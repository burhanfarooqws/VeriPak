﻿using System;
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
            if (GridView1.SelectedIndex == -1) return;
            Response.Redirect("details.aspx?bookid=" + GridView1.SelectedRow.Cells[1].Text);
        }

        protected void btncheckin_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex == -1) return;
            Response.Redirect("checkin.aspx?bookid=" + GridView1.SelectedRow.Cells[1].Text);
        }

        protected void btncheckout_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex == -1) return;
            Response.Redirect("checkout.aspx?bookid=" + GridView1.SelectedRow.Cells[1].Text);
        }

        
    }
}