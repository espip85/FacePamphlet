using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FacePamphlet
{
    public partial class FriendInfo : System.Web.UI.Page
    {

        String Email;
        String FriendEmail;

        protected void Page_Load(object sender, EventArgs e)
        {
            Email = Request.QueryString["Email"];
            FriendEmail = Request.QueryString["FriendEmail"];
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberHome.aspx?Email=" + Email);
        }
    }
}