using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FacePamphlet
{
    public partial class InsertFriend : System.Web.UI.Page
    {

        String Email;

        protected void Page_Load(object sender, EventArgs e)
        {
            Email = Request.QueryString["Email"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String friendEmail = DropDownListFriendSuggestion.SelectedValue;

                SqlDataSourceFriends.InsertParameters.Clear();
                SqlDataSourceFriends.InsertParameters.Add("MyEMail", Email);
                SqlDataSourceFriends.InsertParameters.Add("FriendEmail", friendEmail);

                SqlDataSourceFriends.Insert();

                Response.Redirect("MemberHome.aspx?Email=" + Email);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberHome.aspx?Email=" + Email);
        }
    }
}