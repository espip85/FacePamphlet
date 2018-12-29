using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FacePamphlet
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        String Email;

        protected void Page_Load(object sender, EventArgs e)
        {
            Email = Request.QueryString["Email"];
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ButtonAddPost_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertPost.aspx?Email=" + Email);
        }

        protected void ButtonAddFriend_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertFriend.aspx?Email=" + Email);
        }
    }
}